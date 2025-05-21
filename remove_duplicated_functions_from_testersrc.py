with open("testersrc", "r") as f:
    linhas = f.readlines()
linhas_unicas = list(dict.fromkeys(linhas))  # Mantém a ordem original
with open("lista_sem_duplicatas.txt", "w") as f:
    f.writelines(linhas_unicas)