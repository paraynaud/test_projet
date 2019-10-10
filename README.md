#test_projet

Projet test ayant pour but de créer un projet julia et tester : 
- Travis. 
- La couverture de code. 
- La génération de documents.

J'ai refais plus ou moins pas à pas le dépôt : Example.jl, disponible : 
		- https://github.com/JuliaLang/Example.jl

Démarrer un projet un julia: 
	- Il faut utiliser le gestionnaire de package Pkg. 
	- Pour démmarer un projet, créer une Project.toml il faut dans u premier temps se placer dans le 	 répertoire que l'on souhaite utiliser.
		-> Ensuite on utiliser le gestionnaire de package en tapant " ] "
		-> On utilise la commande " activate . " , le . signifie le répertoire courant.
		-> Puis on utilise " generate <nom_de_projet> " qui créera le Project.toml + 		 
		src/<nom_de_projet>.jl 
	- Si par la suite nous devons utiliser des packages julia dans le projet, il est nécessaire de 	
	réutiliser le gestionnaire de package en activant le projet et en utilisant :
		-> " add <nom_du_package> "


Travis: 
	- Il suffit d'ajout au dépot un fichier .travis.yml qui est sensiblement le même pour tous les 
	projets julia. 
	- Il faut autoriser travis à avoir accès au dépôts github (travis-ci.com)

Test: 
	- Nécessaire d'utiliser le package " Test " 
	- Les tests automatisés de julia cherchent seulement à lancer le fichier : " test/runtests.jl "
	il est donc nécessaire d'avoir ce fichier qui générallement sert de base pour appeler tous les 	
	fichiers de tests.

Couverture de code : Coveralls (je n'ai pas essayé codecov.io)
	- Il est nécessaire d'avoir un compte coveralls.io qui se synchronise avec un github. Puis il 		faut choisir les dépôts qui utiliseront coveralls.
	- Il faut ajouter au .travis.yml : 
		codecov: true
		
		after_success: 
		 - julia -e 'using Pkg; Pkg.add("Coverage"); using Coverage; Coveralls.submit(Coveralls.process_folder())';
	




