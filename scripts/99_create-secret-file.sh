#!/bin/bash

# Input YAML file
# yaml_file="/home/apheon/01_command/01_k3s_production/.config.env"

# # Extract the matching comments and create files
# grep -oE '# [0-9]+_command/[0-9]+_k3s_production/kubernetes/apps/[^[:space:]]+/app/secret.sops.yaml' "$yaml_file" | while read -r comment; do
#     file_name=$(echo "$comment" | sed -e 's/# [0-9]\+_command\/[0-9]\+_k3s_production\/kubernetes\/apps\///' -e 's/\/app\///' -e 's/\//-/g')
#     echo "Creating file: $file_name"
#     # touch "$file_name"
# done


# #!/bin/bash

# # Input YAML file
# yaml_file="/home/apheon/01_command/01_k3s_production/.config.env"


# # Extract the matching comments and create files
# grep -nE '# [0-9]+_command/[0-9]+_k3s_production/kubernetes/apps/[^[:space:]]+/app/secret.sops.yaml' "$yaml_file" | while read -r line; do
#     comment=$(echo "$line" | sed -n 's/.*# \([0-9]\+_command\/[0-9]\+_k3s_production\/kubernetes\/apps\/[^[:space:]]+\/app\/secret.sops.yaml\).*/\1/p')
#     file_name=$(echo "$comment" | sed -e 's/# [0-9]\+_command\/[0-9]\+_k3s_production\/kubernetes\/apps\///' -e 's/\/app\///' -e 's/\//-/g')
#     echo "Creating file: $file_name"
#     touch "$file_name"
#     start_line=$(echo "$line" | awk -F: '{print $1}')
#     next_line=$((start_line + 1))
#     content=$(sed -n "${next_line},/.*# [0-9]\+_command\//p" "$yaml_file")

#     echo "$content" > "$file_name"
# done

#!/bin/bash

# Input YAML file
yaml_file="/home/apheon/01_command/01_k3s_production/.config.env"

output_dir="/home/apheon/01_command/01_k3s_production/tmpl/kubernetes/out"  # Specify the output directory path

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Extract the matching comments and create files
grep -nE '# [0-9]+_command/[0-9]+_k3s_production/kubernetes/apps/[^[:space:]]+/app/secret.sops.yaml' "$yaml_file" | while read -r line; do
    comment=$(echo "$line" | sed -e 's/.*# \([0-9]\+_command\/[0-9]\+_k3s_production\/kubernetes\/apps\/[^[:space:]]+\/app\/secret.sops.yaml\).*/\1/p')
    file_name=$(echo "$comment" | sed -e 's/# [0-9]\+_command\/[0-9]\+_k3s_production\/kubernetes\/apps\///' -e 's/\//-/g' -e 's/-app//'  -e 's/\secret.sops\.yaml$/-secret.sops.yaml/' ) # | sed 's/-app//'     's/\/app\///'

    # file_name=$(echo "$line" | sed -E 's/# [0-9]\+_command\/[0-9]\+_k3s_production\/kubernetes\/apps\///; s/\/app\///g; s/\//-/g; s/-secret.sops.yaml$/-secret.sops.yaml/')


    echo "Creating comment: $comment"
    echo "Creating file: $file_name"

    start_line=$(echo "$line" | awk -F: '{print $1}')
    next_line=$((start_line + 1))
    content=$(sed -n "${next_line},/.*# [0-9]\+_command\//p" "$yaml_file")
    echo "$content" > "$output_dir/$file_name"
done
