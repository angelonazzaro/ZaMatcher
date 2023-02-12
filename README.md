
<p align="center">
    <img width="200" src="https://user-images.githubusercontent.com/58223071/218078925-137865e1-d6fc-4d0c-9c87-51ddc97ac911.png" alt="OpenMeet logo">
</p>

<h3 align="center">
 ZaMatcher
</h3>

<p align="center">
 The <b>open-source</b> machine learning module for dating apps you were looking for. 🤙🏻❤️
</p>
<p align="center">
 <a href="#"><img src="https://img.shields.io/github/contributors/sl1mSha4dey/zaMatcher?style=for-the-badge" alt="Contributors"/></a>
 <img src="https://img.shields.io/github/last-commit/sl1mSha4dey/zaMatcher?style=for-the-badge" alt="last commit">
</p>
<p align="center">
 <a href="#"><img src="https://img.shields.io/badge/PRs-welcome-brightgreen?style=for-the-badge" alt="PRs Welcome"/></a>
 <a href="#"><img src="https://img.shields.io/github/languages/top/sl1mSha4dey/zaMatcher?style=for-the-badge" alt="Languages"/></a>
</p>

<br>


# ZaMatcher 
ZaMatcher is the machine learning module powering ![OpenMeet](https://github.com/sl1mSha4dey/openMeet_Classe03)'s user recommendation system. <br />
It is a machine learning model based on clustering and classification using **Agglomerative Clustering** and **SVC Classification** to recommend users. It has been built using `Jupyter Notebook` and `Python`. <br />
If you want to know more about ZaMatcher you can read the documentation in the `docs` folder. 

## Table of Contents 
- [Repository Contents](#repository-contents)
- [Installation guide](#installation-guide)
  - [Installing Python](#installing-python)
  - [Installing Jupyter](#installing-jupyter)
  - [Clone the repo](#clone-the-repo)
  - [What about dependecies?](#what-about-dependecies)
  - [What about the mobile app](#what-about-the-mobile-app)

## Repository Contents
The repository is structured as follows: 
- `interests.csv`: contains the set of all interests used in the project; 
- `us_cities.csv`: contains the set of all US cities used in the project along with their latitude and longitude coordinates; 
- `create_dataset.ipynb`: contains the script necessary to create the dataset on which the clusterizer will be trained; 
- `clustering.ipynb`: contains the implementations of the various clustering algoritms used to obtain the clusterier; 
- `clustered_datset.csv`: contains the initial dataset with the an additional feature indicating each row's cluster label; 
- `classifier.ipynb`: contains the implementations of the various classification algorithms used to obtain the classifier; 
- `model.sav`: it's the exported classifier model; 
- `user_predict.ipynb`: contains the script necessary to predict a new user and to retrain the model in case new features get added to the dataset;
- `WebService`: contains the Flask app that is used to integrate the model with the mobile application; 
- `iOS_MobileApp`: contains the mobile app running on iOS used to deploy the model; 

## Installation Guide
In order to install and use **ZaMatcher** on your environment you will need: 
- `Python 3.*` 
- `Jupyter Notebook` or `Jupyter Lab` 

### Installing Python 
Depending on your OS the process for installing python may be different from other others'. We recommed to follow the official guide [Python](https://www.python.org/downloads/).  

### Installing Jupyter
In order to install jupyter it is **mandatory** to have Python installed on your machine, so if you do not have Python on your machine please gp back the previous step. 
To install JupyterLab open up your terminal and type: 
```bash
pip install jupyterlab
``` 
If you want to install Jupyter Notebook just type: 
```bash
pip install notebook
```

### Clone the Repo 
There are two ways to clone this repository: 
- using `git` and your `terminal`
- using the tools provided by the github web application 

**Before cloning this repository using `git`, remember to navigate to the location where you want the repository to actually be saved on your machine**. <br> In order to clone this repository using `git`, open up your terminal and paste the following command: 
```bash
git clone https://github.com/sl1mSha4dey/zaMatcher.git
```

If you don't feel confident with commands and stuff, you can use the web application to download the `.zip` containing the repository by clicking on the `<> Code` button on the top-right of the repository container, then in the small modal that appears go on and click on the `Download zip` button. <br>
<div align="center"> 
 <img src="https://user-images.githubusercontent.com/58223071/218076863-0fa25c8e-4c37-43a1-8ec4-bfb4a699b378.png" />
</div>

### Start up Jupyter 
Once you have done all the previous steps, all that's left to do is to start up juypter. <br/> 
Open up your terminal app and paste the following command: 
```bash
jupyter-lab
``` 
If you have installed jupyter-notebook, just type `jupyter notebook`. <br/>
Once the jupter environment finishes loading, navigate to the folder where you have cloned the repository and have fun :blush:!

### What about dependecies? 
If you are wondering about what dependecies we have used and what you have to install don't worry, we have included an installation script in the notebooks!

### What about the mobile app? 
Since the mobile application is still under construction, once we have reached a sort of stable version a new section describing the installation process of the mobile application will be uploaded. 

## Contributing 
If you would like to contribute to the project, please follow the following guidelines [Contributing](). 
