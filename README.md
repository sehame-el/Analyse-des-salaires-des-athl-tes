# Analyse Économétrique des Salaires des Joueurs du PSG  

## Introduction  
Bienvenue dans ce projet d’analyse économétrique portant sur les **facteurs déterminants les salaires des athlètes**.  

Les revenus très élevés de certains joueurs suscitent régulièrement des débats, notamment en raison de leur **impact sur les inégalités sociales**. Le salaire est un indicateur clé qui influence directement le bien-être économique d’un individu et, par extension, celui de la société.  

Ce projet se concentre sur un **cas spécifique : les salaires des joueurs du Paris Saint-Germain (PSG)**.  
L’objectif est de répondre à la question suivante :  

**Quels sont les facteurs qui influencent les écarts de salaire entre les joueurs d’un même club de football ?**  

## Objectifs  
1. **Comparer** la formation des salaires des footballeurs à celle des salaires conventionnels.  
2. **Évaluer** si le niveau sportif est la principale variable explicative des écarts de salaire.  
3. **Discuter** de la légitimité des salaires très élevés dans le sport professionnel.  

---

## Données et Variables  

### Source des Données  
Les données proviennent du PSG et concernent les **joueurs professionnels de l’effectif actuel**.  

### Variables Sélectionnées  
Les variables classiques expliquant un salaire ont été adaptées au contexte sportif :  

| **Variable**  | **Description**  | **Attendue**  |
|--------------|----------------|--------------|
| `Salaire`  | Logarithme du salaire annuel en euros  | Variable dépendante |
| `Ancienneté` | Nombre d’années passées au PSG  | Influence négative |
| `Palmarès` | Nombre de trophées remportés | Influence positive |
| `Insta` | Nombre d’abonnés Instagram | Influence positive |

---

## Méthodologie  

L’analyse est réalisée à l’aide d’un **modèle de régression linéaire multiple** avec la formule suivante :  

log(Salaire) = beta_0 + beta_1 * Ancienneté + beta_2 * Palmarès + beta_3 * Insta + epsilon

**Pourquoi un modèle log-linéaire ?**  
- Pour **réduire la dispersion** des salaires extrêmes.  
- Pour **interpréter les coefficients comme des élasticités** (variation en % du salaire).  

---

## Analyse des Données  

### Étude des Variables  
- **Salaire** : distribution très inégale, confirmant de **grandes disparités** au sein du club.  
- **Ancienneté** : majorité de joueurs récents, dû au **marché des transferts actif**.  
- **Palmarès** : hétérogénéité forte, certains joueurs ayant beaucoup plus de trophées.  
- **Insta** : grande variabilité, avec des **stars internationales très suivies**.  

### Résultats de la Régression  

| **Variable**  | **Effet (%)**  | **Significativité** |
|--------------|--------------|----------------|
| **Ancienneté** | -15,91 %  | 5 % |
| **Palmarès** | +8,29 % | 5 % |
| **Insta** | +0,0023 % | 5 % |

- **Ancienneté** : influence négative, un joueur plus ancien voit son salaire diminuer, peut-être dû à une perte de compétitivité.  
- **Palmarès** : effet positif, les joueurs les plus titrés sont mieux payés.  
- **Insta** : influence faible mais significative, confirmant un **effet "star system"** sur les salaires.  

### Qualité du Modèle  
- **R² = 58,12 %** → Le modèle explique **58 % de la variance des salaires**.  
- **Tests statistiques** :  
  **- Normalité des résidus** (test de Shapiro, p = 0,55)  
  **- Homoscédasticité** (test de Breush-Pagan, p = 0,17)  
  → **Aucune correction du modèle nécessaire.**  

---

## Discussion et Interprétation  

Les résultats permettent de **confronter deux théories économiques** appliquées aux sportifs :  

- **Théorie des superstars** : le **talent n’est pas la seule variable** influençant la célébrité. La corrélation entre popularité et performance reste limitée (31 %).  
- **Théorie du tournoi** : confirmée par les résultats, les **clubs utilisent les salaires élevés pour attirer les meilleurs talents**.  

### Analyse des Facteurs  
- **L’ancienneté agit négativement** sur le salaire : les clubs préfèrent miser sur de nouveaux talents.  
- **Le niveau (palmarès) reste la variable la plus influente** : les clubs cherchent avant tout à **gagner des titres**.  
- **La popularité influence aussi les salaires**, même si son impact est plus faible.  

**Limites du modèle :**  
  **- Peu d’observations** → échantillon restreint au PSG.  
  **- Le palmarès ne distingue pas la valeur des trophées** (Ligue des Champions vs. Coupe nationale).  

---

## Conclusion  

**Le modèle confirme que les salaires des footballeurs ne suivent pas les mêmes règles que les salaires conventionnels.**  

1. **Le niveau du joueur est bien un facteur clé** mais pas le seul déterminant du salaire.  
2. **La célébrité joue un rôle, même si elle est moins influente que la performance sportive.**  
3. **Les salaires élevés sont justifiés par la rareté des talents et la croissance du marché du sport-business.**  

**Légitimité des salaires ?**  
→ Cela reste **une question subjective**, selon que l’on considère le football comme un simple sport
