
inp_label = "./data/ijcnlp_dailydialog/dialogues_emotion.txt"
f_label = open(inp_label, encoding='utf-8')

labels = []
for dialogue in f_label:
    lines = dialogue.split(' ')
    for line in lines:
        if line == '\n':
            continue
        labels.append(line)

n = 0

for i in labels:
    if i == '0':
        n+=1
print(n)
print(n/len(labels))