# load in assistant/requirements.txt to a list where each element is a line in the file
assistant_requirements = []
with open('assistant/requirements.txt', 'r') as f:
    for line in f:
        assistant_requirements.append(line.strip())

nlp_server_requirements = []
with open('nlp_server/requirements.txt', 'r') as f:
    for line in f:
        nlp_server_requirements.append(line.strip())

# vision_server_requirements = []
# with open('vision_server/requirements.txt', 'r') as f:
#     for line in f:
#         vision_server_requirements.append(line.strip())

# merge the requirements from all three files, leaving no duplicates if they exist
# merged_requirements = list(set(assistant_requirements + nlp_server_requirements + vision_server_requirements))
merged_requirements = list(set(assistant_requirements + nlp_server_requirements))

# # find items in the list that do not have a version and use the version on the current machine
# import pkg_resources
# for i in range(len(merged_requirements)):
#     # if pydantic is in the requirements, remove it
#     if merged_requirements[i].find("pydantic") != -1:
#         merged_requirements.remove(merged_requirements[i])
#     if merged_requirements[i].find("==") == -1:
#         try:
#             dist = pkg_resources.get_distribution(merged_requirements[i])
#             merged_requirements[i] = merged_requirements[i] + "==" + dist.version
#         except pkg_resources.DistributionNotFound:
#             print("Could not find version for: " + merged_requirements[i])
#             print('Leaving version as is.')

# write the merged requirements to a new file
with open('requirements.txt', 'w') as f:
    for item in merged_requirements:
        f.write("%s\n" % item)