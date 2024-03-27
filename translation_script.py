import os
import argparse
from dotenv import load_dotenv
from openai import OpenAI

load_dotenv()
client = OpenAI(api_key=os.getenv('OPENAI_API_KEY'))

def write_tex_file(tex_string, file_path):
    with open(file_path, 'w', encoding='utf-8') as file:
        file.write(tex_string)

def read_tex_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        tex_string = file.read()
    return tex_string


def add_suffix_to_file(file_path, suffix):
    directory, file_name = os.path.split(file_path)
    base_name, extension = os.path.splitext(file_name)
    new_file_name = f"{base_name}_{suffix}{extension}"
    new_file_path = os.path.join(directory, new_file_name)

    return new_file_path


def translate_tex_file(code, language, translate_to):
    completion = client.chat.completions.create(
        model="gpt-3.5-turbo-16k-0613",
        messages=[
            {
                "role": "system",
                "content": f"""You are a helpful and accurate latex documents translator that will receive a LaTex code in tex and translate from {language} to {translate_to}.
                You shall return the code and only the code of the translated document, avoid any additional text and also, do not translate things inside LaTex commands.
                """
            },
            {"role": "user", "content": code}
        ]
    )
    return completion.choices[0].message.content


def main():
    parser = argparse.ArgumentParser(description='Translate LaTeX documents.')
    parser.add_argument('file_path', type=str, help='Path to the LaTeX file to translate')
    parser.add_argument('language', type=str, help='Language of the original LaTeX document')
    parser.add_argument('translate_to', type=str, help='Language to translate the LaTeX document to')
    args = parser.parse_args()

    file_path = args.file_path
    language = args.language
    translate_to = args.translate_to

    tex_code = read_tex_file(file_path)
    translated_tex_code = translate_tex_file(tex_code, language, translate_to)
    translated_doc_path = add_suffix_to_file(file_path=file_path, suffix=translate_to)
    write_tex_file(translated_tex_code, translated_doc_path)


if __name__ == '__main__':
    main()
