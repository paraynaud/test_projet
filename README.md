##test_projet



Projet test ayant pour but de créer un projet julia et tester : 
- Création de projet julia
- Tests/Travis. 
- La couverture de code. 
- La génération de documents.

J'ai refais pas à pas le dépôt : Example.jl, disponible : 
		- https://github.com/JuliaLang/Example.jl

##Création de projet julia 
	- Il faut utiliser le gestionnaire de package Pkg. 
		>julia ]
		>(v1.0) pkg>
	- Pour faire une projet julia en se simplifiant la vie, il est nécessaire d'avoir un fichier Project.toml . Ce fichier fais office de header à tous le projet en indiquant les dépendances du projet, de même pour le fichier Manifest.toml . La manière la plus simple de le faire est d'utiliser le gestionnaire de package.
		-> On utilise la commande " activate . " , le . signifie le répertoire courant.
		-> Puis on utilise " generate <nom_de_projet> " qui créera le répertoire contenant src/<nom_de_projet>.jl + le Project.toml
	- Si par la suite nous devons utiliser des packages julia dans le projet, il est nécessaire de 	
	réutiliser le gestionnaire de package en activant le projet et en utilisant :
		-> " add <nom_du_package> ", ce qui gèrera automatiquement le Project.toml et Manifest.toml


##Travis: 
	- Il suffit d'ajout au dépot un fichier .travis.yml qui est sensiblement le même pour tous les 
	projets julia. Voir:
		https://github.com/paraynaud/PartiallySeparableStructure.jl/blob/master/.travis.yml
	- Il faut autoriser travis à avoir accès au dépôts github (travis-ci.com) en synchronisant avec son propore compte github.
	- Il faudra ajouter une clé ssh pour la génération de la doc
	- attention à bien mettre 
		coveralls: true 
	et pas codecov: true ...	

##Test: 
	- Nécessaire d'utiliser le package " Test " 
	- Les tests automatisés de julia cherchent seulement à lancer le fichier : " test/runtests.jl "
	il est donc nécessaire d'avoir ce fichier qui générallement sert de base pour appeler tous les 	
	fichiers de tests.
	- Sont lancés automatiquement par travis

##Couverture de code : Coveralls (je n'ai pas essayé codecov.io)
	- Il est nécessaire d'avoir un compte coveralls.io qui se synchronise avec un github. Puis il 		faut choisir les dépôts qui utiliseront coveralls.
	- Il faut ajouter au .travis.yml : 
		codecov: true
		...
		after_success: 
		 - julia -e 'using Pkg; Pkg.add("Coverage"); using Coverage; Coveralls.submit(Coveralls.process_folder())';
	- Il est aussi nécessaire que le projet transmis à Travis fasse le Build. Sinon il n'y aura pas d'informations tranmises à coveralls. 
	- ATTENTION : une fois Travis ne faisait pas le build automatiquement, il ne faisait pas du tout le skip et passait directement à la création de doc. 
	

##Documentation: 
	- Il faut écrire la documentation sous un certain format de commentaires. (connu)
	- Il faut aussi modifier le .travis.yml de manière à ce que cela génère la doc. (regarder le fichier .travis.yml)
	- Pour qu'il puisse la générer il est nécessaire qu'il ai certains accès et il faut donc créer des clés ssh  (explication):
		https://juliadocs.github.io/Documenter.jl/stable/man/hosting/ 
	-> DocumenterTool.genkeys génère les clés ssh et indique plus ou moins où il faut les rentrer entre github et travis.
	- github titre de la clé ssh : documenter 
	- variable sécurisé travis : DOCUMENTER_KEY
	appel de la fonction : 
		DocumenterTools.genkeys(user="paraynaud", repo="PartiallySeparableStructure.jl")
		DocumenterTools.genkeys(user="identifiant_github", repo="depot_github")
	- Pour le moment je n'arrive pas à avoir la doc en ligne, j'ai fais tout ce qui était indiqué mais ça n'a pas l'air de marcher.
	- Mais j'obtient une nouvelle branche github dans laquelle il y a un fichier html qui contient la doc qui peut s'executer dans un interpréteur de html.
	-Enfin ce qu'il faut ajouter dans le dépôt : 
		- un repertoire: 
			docs/ 
			   |-->  make.jl
			   |-->  Project.toml 
			   |-->	 src/
				  |--> index.md









