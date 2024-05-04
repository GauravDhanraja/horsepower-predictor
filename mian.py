import pandas as pd
import numpy as np 
import pickle
from sklearn.linear_model import LinearRegression

def train_and_save_model():
    data = pd.read_csv("mtdata.csv")

    X = data[['cly', 'disp']].values
    Y = data['hp'].values

    model = LinearRegression()
    model.fit(X, Y)

    with open('model.pkl', 'wb') as f:
        pickle.dump(model, f)

def get_user_inputs():
    cly = float(input("Enter the number of cylinders (cly): "))
    disp = float(input("Enter the displacement (disp): "))
    return cly, disp

if __name__ == "__main__":
    train_and_save_model()

    with open('model.pkl', 'rb') as f:
        model = pickle.load(f)

    cly, disp = get_user_inputs()
    predicted_hp = model.predict([[cly, disp]])
    print("Predicted HP:", predicted_hp[0])
