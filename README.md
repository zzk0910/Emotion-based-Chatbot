# Emotion-based-Chatbot
NUS IS5452 Project

## Before starting the program
Clone this repo to a desired local location.

### Prepare environment
```shell
pip install -r requirements.txt
```

### Prepare GPT-2 Model
- Download the fine-tuned GPT-2 model from [google drive sharing link](https://drive.google.com/file/d/1vO3N0RKABo0p1shm7I6drUNMnbHY3NU6/view?usp=sharing).

    The file is about 1GB, including two models:
    > *level1000*: Fine-tuned for 1000 steps with Q&A sentences from professional mental consultation platform (more stick to depression-related expressions)
    > 
    > *level400*: Fine-tuned for 400 steps with Q&A sentences from professional mental consultation platform (more general)

    The default model used is "run2". To choose between these two models, change line 50 in file GUI/ChatbotPage.py as follows

    ```python
    self.model_name = "level400"
    ```

- GPT-2 model file structure

    After downloading the fine-tuned GPT-2 model, unzip the file and put the folder "checkpoint" to the path "./Emotion-based-Chatbot/Generation/checkpoint"
    The program structure should look like this:
    

### Prepare Emotion Classfication model
- init model serving
```shell
cd Serving
python serving_ER.py
```

## Start the program
- run app
```shell
cd ../GUI
python APP.py

```
