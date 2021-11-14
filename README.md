# Emotion-based-Chatbot
NUS IS5452 Project

**Folders:**

- *EmotionRecognition*: Code of emotion recognition model
- *Generation*: Code of GPT-2 text generation model
- *GUI*: Code to create graphical user interface 
- *Serving*: Code to start the emotion recognition model service (avoid tensorflow conflicts when the GPT-2 model)

**Demo:**

- *LittleGenius_Demo.mp4*: Shows how this application works


## Before starting the program
Clone this repo to a desired local location.

### Prepare environment
```shell
pip install -r requirements.txt
```


### Prepare GPT-2 Model
- Download the fine-tuned GPT-2 model from [google drive sharing link](https://drive.google.com/file/d/11h7j5w4OKM_27ZIG744KqEwY95HXGqVQ/view?usp=sharing).

    The file is 884.3MB, including two models:
    > *level1000*: Fine-tuned for 1000 steps with Q&A sentences from professional mental consultation platform (more stick to depression-related expressions)
    > 
    > *level400*: Fine-tuned for 400 steps with Q&A sentences from professional mental consultation platform (more general)

    The default model used is *level400*. It is defined by line 46 in file GUI/ChatbotPage.py.
    ```python
    self.model_name = "level400"
    ```
    
    To choose model *level1000*, change this line to
    ```python
    self.model_name = "level1000"
    ```


- GPT-2 model file structure

    After downloading the fine-tuned GPT-2 model, unzip the file and put the folder "checkpoint" to the path "./Emotion-based-Chatbot/Generation/checkpoint".
    
    The program structure should look like this:
             
    <img width="351" alt="checkpoint" src="https://user-images.githubusercontent.com/67768426/141467504-b648ef40-5ef5-4909-b57a-76225d73a564.png">
    

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
