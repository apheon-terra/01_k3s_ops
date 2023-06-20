# import re

# def extract_filename_from_comment(comment):
#     pattern = r"#\s([\w\/\-.]+\.sops\.yaml)"
#     match = re.search(pattern, comment)
#     if match:
#         return match.group(1).replace('/', '-')

# def process_file(file_path):
#     with open(file_path, 'r') as file:
#         content = file.read()
#         lines = content.split('\n')

#         for line in lines:
#             if line.startswith('#'):
#                 extracted_filename = extract_filename_from_comment(line)
#                 if extracted_filename:
#                     source_filename = extracted_filename.replace('-', '/')
#                     new_filename = extracted_filename.replace('/', '-')
#                     new_file_content = f"This is the content for {new_filename}"

#                     # Write the extracted content to the new file
#                     with open(new_filename, 'w') as new_file:
#                         new_file.write(new_file_content)

#                     print(f"Created file: {new_filename}")

#     print("Processing complete.")

# # Specify the path to the YAML file
# yaml_file_path = '/home/apheon/01_command/01_k3s_production/.config.env'

# # Process the YAML file
# process_file(yaml_file_path)












# import os
# import re

# def extract_filename_from_comment(comment):
#     pattern = r'#\s*(\d+_command/\d+_k3s_production/kubernetes/apps/[\w/]+)'
#     match = re.search(pattern, comment)
#     if match:
#         filepath = match.group(1)
#         # Replace slashes with hyphens to form the desired filename
#         filename = filepath.replace('/', '-')
#         return filename
#     return None

# def extract_filenames_from_yaml(file_path):
#     with open(file_path, 'r') as file:
#         content = file.read()

#         # Extract comments matching the pattern and extract filenames
#         pattern = r'#\s*\d+_command/\d+_k3s_production/kubernetes/apps/[\w/]+'
#         comments = re.findall(pattern, content)
#         filenames = [extract_filename_from_comment(comment) for comment in comments if extract_filename_from_comment(comment)]
#         return filenames

# def create_files(filenames):
#     for filename in filenames:
#         with open(filename, 'w') as file:
#             file.write("")

# def main():
#     yaml_path = input("Enter the path to the YAML file: ")

#     # Extract filenames from the YAML file
#     filenames = extract_filenames_from_yaml(yaml_path)

#     # Create files with the extracted filenames
#     create_files(filenames)

#     # Display the created filenames
#     for filename in filenames:
#         print(f"Created file: {filename}")

# if __name__ == "__main__":
#     main()



import os
import re

def extract_filename_from_comment(comment):
    # pattern = r'#\s*default/([\w-]+)/app/secret.sops.yaml'
    pattern = r'#\s*default/([^/\n]+)/app/secret.sops.yaml'

    match = re.search(pattern, comment)
    if match:
        app_name = match.group(1)
        filename = f"default-{app_name}-secret.sops.yaml"
        return filename
    return None

def extract_filenames_from_yaml(file_path):
    with open(file_path, 'r') as file:
        content = file.read()

        # Extract comments matching the pattern and extract filenames
        pattern = r'#\s*default/([^/\n]+)/app/secret.sops.yaml'

        # pattern = r'#\s*\d+_command/\d+_k3s_production/kubernetes/apps/[\w/]+'
        comments = re.findall(pattern, content)
        filenames = [extract_filename_from_comment(comment) for comment in comments if extract_filename_from_comment(comment)]
        return filenames

def create_files(filenames):
    for filename in filenames:
        with open(filename, 'w') as file:
            file.write("")

def main():
    yaml_path = input("Enter the path to the YAML file: ")

    # Extract filenames from the YAML file
    filenames = extract_filenames_from_yaml(yaml_path)

    # Create files with the extracted filenames
    create_files(filenames)

    # Display the created filenames
    for filename in filenames:
        print(f"Created file: {filename}")

if __name__ == "__main__":
    main()
