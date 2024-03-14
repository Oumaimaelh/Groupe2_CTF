### Objectif:

Ce projet a pour objectif de proposer aux participants une série de challenges CTF 
couvrant divers aspects de la sécurité informatique. Les challenges permettront aux
 participants de mettre en pratique leurs connaissances et compétences en matière de 
 sécurité, et de découvrir de nouvelles technologies et techniques.

### Contenu:

- **Facile**: Convient aux débutants en sécurité informatique.
- **Moyenne/Difficile**: Pour les participants plus expérimentés.

>Chaque challenge est accompagné d'un dossier "docs" contenant :

  - **L'énoncé du challenge**: Description du challenge et des objectifs à atteindre.
  - **Les fichiers nécessaires**: Fichiers sources, images, etc.
  - **le scénario**: aide pour avoir une visio globale sur le challenge en question
  - **Des indices**: Aide pour les participants qui rencontrent des difficultés.
  - **Solution**: fournit des solutions du challenge en détails.

### Mise en place:
Environnements supportés:
- **Cloud AWS**
- **OpenStack**
- **Local (en lançant les scripts `install.sh`) pour CTF1 et `machine1.sh`, `machine2.sh` pour le CTF2**

##### Prérequis:

> Avoir les droits d'administrateur sur la machine ou le cloud où vous souhaitez installer les challenges.
 Avoir installé les outils nécessaires pour exécuter les scripts d'installation (ex: bash, curl).

#### Procédure:

1. Choisir l'environnement de déploiement:
   - Cloud AWS: Veuillez consulter la documentation AWS pour les instructions spécifiques à votre environnement.
   - OpenStack: Veuillez consulter la documentation OpenStack pour les instructions spécifiques à votre environnement.
   - Local: Suivez les étapes ci-dessous.

2. Télécharger le projet:

``` sh
git clone https://github.com/Oumaimaelh/Groupe2_CTF.git
```
3. Se rendre dans le dossier du challenge:

``` sh
cd Groupe2_CTF/<nom-du-challenge>
```
> On va faire le challenge 1 mais c'est pareil pour le challenge 2 suffit juste de lancer `machine1.sh et machine2.sh `
> 
4. Personnaliser le fichier `install.sh`:

    Modifier les noms de fichiers et d'utilisateurs si nécessaire.
    Assurez-vous d'avoir les droits d'exécution sur le fichier `install.sh`:

``` sh
chmod +x install.sh

```
5. Lancer le script d'installation:
``` sh
./install.sh
```
6. Suivre les instructions à l'écran(le dossier Docs dans chaque challenge)

### Résolution des challenges:

> Pour résoudre les challenges, les participants peuvent utiliser différentes techniques, et le but c'est de trouver les flags sous format : ```tomy{text}```

### Conclusion:

Ce projet propose une série de challenges CTF permettant aux participants de tester leurs connaissances 
et compétences en matière de sécurité informatique. Les challenges sont variés et couvrent différents
aspects de la sécurité, ce qui permet aux participants d'apprendre et de progresser dans ce domaine.
