import pandas as pd
from collections import namedtuple
from pandas import DataFrame
from typing import List

def to_named_tuple_list(data_frame: DataFrame) -> List[namedtuple]:

    column_names = [column_name.lower().replace(" ", "_") for column_name in data_frame.columns]
    Data_tuple = namedtuple("Data_tuple", column_names)
    data_list = []

    for item in data_frame.values:
        data_list.append(Data_tuple(item[0], item[1], item[2], item[3], item[4], item[5:]))

    return data_list


def main() -> None:

    data_frame = pd.read_csv(r"..\dataset\dataset.csv")
    data_list = to_named_tuple(data_frame)

    for item in data_list:
        print(item)


if __name__ == '__main__':
    main()
