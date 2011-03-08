import sys
import os
import nltk

def createSchedule(f, text):
    # item, place, time, description
    output = ''
    tokens = nltk.word_tokenize(text)
    tokens = nltk.pos_tag(tokens)
    print tokens

    # item
    item = '-'
    for token in tokens:
        if token[1] == 'NN':
            item = token[0]
            break
    output += item + ','

    # place
    place = '-'
    if item.lower() in ['camera', 'car', 'salt']:
        place = item + ' store'
    output += place + ','

    # time
    time = '-'
    output += time + ','

    # description
    output += text

    if output != '-,-,-,':
        f.write(output)


def main(script, dir_path, inputText):
    dir_path = str(sys.argv[1])
    inputText = str(sys.argv[2])
    f = open(dir_path + '_test.txt', 'w')

    for line in inputText.split('.'):
        createSchedule(f, line)
        f.write('\n')

if __name__ == '__main__':
    """
    inputText = 'I need a new camera. I need some salt.'
    f = open('test.txt', 'w')

    for line in inputText.split('.'):
        createSchedule(f, line)
        f.write('\n')
    """
    main(*sys.argv)
