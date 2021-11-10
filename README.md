# Emotion-based-Chatbot
NUS IS5452 Project

- gpt-2 model loading
Download the re-trained got-2 model from [google drive sharing link](https://drive.google.com/file/d/1vO3N0RKABo0p1shm7I6drUNMnbHY3NU6/view?usp=sharing).

The file is about 1Gb, including two models:

    - run2: Fine-tuned for 1000 steps with Q&A sentences from professional mental consultation platform (more stick to depression-related expressions)

    - run3: Fine-tuned for 400 steps with Q&A sentences from professional mental consultation platform (more general)

The default model used is "run2". To choose between these two models, change line 50 in file GUI/ChatbotPage.py as follows

```python
self.sess2 = load_generation_model(model_name="run3")
```

- install environment
```shell
pip install -r requirements.txt

```
- init model serving
```shell
cd Serving
python serving_ER.py

```
- run app
```shell
cd ../GUI
python APP.py

```
