# SmartWords (ou le nom que vous souhaitez)

L'objectif est de permettre à un utilisateur d'horodater du contenu textuel, et de certifier sa propriété par un NFT.  
Pour bien comprendre ce que vous devez faire, pas de secret il faut se mettre à la place d'un utilisateur, pour déterminer les fonctionnalités essentielles.

L'application sera composé d'une interface web qui sera l'interface entre l'utilisateur et notre (ou nos) smart contract.
L'utilisateur pourra écrire du texte, ou le copier coller, et un hash keccack256 sera généré.
Pour que ce hash soit réellement unique pour un même texte, il faudra traiter le texte coté front. On peut imaginer le traitement suivant:

- Supprimer les espaces inutiles.
- Supprimer la ponctuation
- Mettre tout les caractères en majuscules ou en minuscules.
- d'autres pistes??

Une fois le texte traité on pourra ensuite générer un hash (`ethers.utils.id`) que l'on stockera dans un smart contract avec sa date de génération.  
Pour faire simple ce smart contract peut aussi être un ERC721, ainsi nous pouvons centraliser le stockage de ce hash et le lier à son propriétaire.
De plus nous pouvons générer un NFT qui correspondra au hash de ce texte pour certifier de la propriété de l'utilisateur.
NFT qui sera échangeable, ainsi l'utilisateur pourra céder ses droits.

Pour plus tard il faudra néanmoins penser à stocker le texte qui correspond au hash généré, des fois que l'utilisateur perdrait le texte. On peut imaginer le stocker sur sur un cloud, sur notre serveur ou **encore mieux sur IPFS**.  
Le stockage de ce texte n'est pas de la responsabilité du smart contract mais de l'application front ou backend.  
Nous pourrons ainsi ensuite en plus du hash y associer l'url du texte dans nos mappings.

Plusieures questions à ce poser, comme quels sont les structures de données à utiliser (quels mappings et quelles clefs/valeurs devront être associé).  
Comment accèder aux données, quels sont les getters que sont nécéssaires.  
adresse de l'utilisateur mappée au hash du texte ou bien le hash du texte mappé à l'adresse de l'utilisateur ? ou bien les deux?

L'exercice est ouvert, il y a plusieurs solution. Avec vos connaissances vous pouvez au moins réussir les 2 première parties, Front web + smart contract ERC721, sachant que l'ojectif lorsqu'on s'attaque à un projet comme ca, c'est de réfléchir en amont, puis retirer toutes les fonctionnalités non essentielles pour faire fonctionner votre application avec ce qu'il y a de plus simple mais pertinent.  
Une démonstration d'un texte traité suivit automatiquement d'un NFT délivré à l'utilisateur est la core feature de ce projet.
