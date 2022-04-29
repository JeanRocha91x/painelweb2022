# ATUALIZAR PACOTES DO SISTEMA
```
apt-get update -y; apt-get upgrade -y;
```

# SINCRONIZAR NA VPS, COMPATÍVEL COM O PAINEL GESTOR-SSH!
# NÃO COMPATÍVEL COM SCRPT SSHPLUS PRO!
# ATUALIZAÇÃO 28/04/2022.
```
apt install dos2unix -y; wget https://raw.githubusercontent.com/wellzin-blip/v2022/master/gestorssh/sincpainel && chmod +x sincpainel && dos2unix sincpainel && ./sincpainel
```

# ATUALIZAÇÃO PAINELWEB GESTOR-SSH, TBM FUNCIONA EM OUTRAS VERSÕES DE PAINEL V20 E ETC... EM DEBIAN 8 OU UBUNTU 14!
# ATUALIZAÇÃO 28/04/2022.
```
apt install dos2unix -y; wget https://raw.githubusercontent.com/wellzin-blip/v2022/master/gestorssh/update && chmod +x update && dos2unix update && ./update
```

# INSTALAR PAINELWEB GESTOR-SSH DEBIAN 8 OU UBUNTU 14!
```
wget raw.githubusercontent.com/wellzin-blip/v2022/master/gestorssh/install ; bash install
```

# DEFINIR/ALTERAR SENHA ROOT
```
wget raw.githubusercontent.com/wellzin-blip/v2022/master/gestorssh/senharoot ; bash senharoot
```

# SINCRONIZAR NA VPS, CASO SEJA SSHPLUS PRO!
```
apt install dos2unix -y; wget https://raw.githubusercontent.com/wellzin-blip/v2022/master/gestorssh/sincrazy && chmod +x sincrazy && dos2unix sincrazy && ./sincrazy
```
