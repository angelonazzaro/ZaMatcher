from flask import Flask, request
import pandas as pd
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.preprocessing import MinMaxScaler
import joblib

app = Flask(__name__)


def apply_filters(clustered, df_user, result_from_classifier):
    user_searching_gender = clustered.loc[clustered['Cluster #'] == result_from_classifier]

    match df_user['searching_gender'][0]:
        case "M":
            user_searching_gender = user_searching_gender.loc[user_searching_gender['gender'] == 'M']
        case 'F':
            user_searching_gender = user_searching_gender.loc[user_searching_gender['gender'] == 'F']
        case 'N':
            user_searching_gender = user_searching_gender.loc[user_searching_gender['gender'] == 'N']
        case 'B':
            user_searching_gender = pd.concat([user_searching_gender.loc[user_searching_gender['gender'] == 'F'],
                                               user_searching_gender.loc[user_searching_gender['gender'] == 'M']])

    users_searching_user_gender = pd.DataFrame(columns=user_searching_gender.columns)

    for index, row in user_searching_gender.iterrows():
        match df_user["gender"][0]:
            case "M":
                if row["searching_gender"] == 'M' or row["searching_gender"] == 'B' or row["searching_gender"] == 'A':
                    users_searching_user_gender = pd.concat([users_searching_user_gender, row.to_frame().T])
            case 'F':
                if row["searching_gender"] == 'F' or row["searching_gender"] == 'B' or row["searching_gender"] == 'A':
                    users_searching_user_gender = pd.concat([users_searching_user_gender, row.to_frame().T])
            case 'N':
                if row["searching_gender"] == 'N' or row["searching_gender"] == 'A':
                    users_searching_user_gender = pd.concat([users_searching_user_gender, row.to_frame().T])

    return users_searching_user_gender


@app.route('/', methods=['POST'])
def process_request():
    df_user = pd.DataFrame.from_dict({**request.args}, orient='index').T

    clustered = pd.read_csv("../clustered_dataset.csv")

    vect = CountVectorizer(tokenizer=lambda interests: interests.split(", "), lowercase=True)
    vect_labels = vect.fit_transform(df_user["interests"])

    df_user = pd.concat([df_user, pd.DataFrame(data=vect_labels.toarray(), columns=vect.get_feature_names_out())],
                        axis=1)

    merged = pd.concat([clustered, df_user], ignore_index=True)
    merged = merged.fillna(0)

    del merged['name']
    del merged['surname']
    del merged['gender']
    del merged['searching_gender']
    del merged['age']
    del merged['Cluster #']
    del merged['interests']

    scaler = MinMaxScaler()
    merged[merged.columns] = scaler.fit_transform(merged[merged.columns])

    row = merged.iloc[-1:]

    clf = joblib.load('../model.sav')
    value = clf.predict(row)
    n_cluster = value[0]

    cluster_group = clustered.loc[clustered['Cluster #'] == n_cluster]

    result = apply_filters(clustered, df_user, n_cluster)

    new_df = result[["name", "surname", "age", "gender", "searching_gender", "latitude", "longitude", "interests"]]

    return new_df.to_json(orient='records')


if __name__ == '__main__':
    app.run()
