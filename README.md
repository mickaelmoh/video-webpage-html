# Merveil · Les gestes utiles

Vidéothèque pour les équipes, accessible sans connexion.

## Contenu

Export du 30 octobre 2026 depuis `T3_D_Videos` du Référentiel Merveil. 53 vidéos : 29 d’utilisation et 24 de dépannage. Les vidéos Client et Interne sont incluses ; les tutoriels clients servent aussi aux équipes. Seules les lignes `Publiée` avec un lien sont retenues. Formation, Accès et Entretien sont exclus, ainsi que les vidéos obsolètes, à faire ou à refaire. Les vidéos de dépannage Master Lock sont incluses en tant que dépannage d’équipement ; aucune vidéo de parcours d’accès aux appartements n’est présente.

Le fichier HTML contient uniquement titre, catégorie, équipement, modèle, langue renseignée et lien vidéo. Aucun code d’accès, contact, note interne ni identifiant de connexion Grist. Les champs non renseignés restent vides. Les vidéos sont lues sur YouTube et ne sont pas copiées dans le dépôt.

## Fonctionnement

`index.html` est autonome, sans installation ni compilation. Recherche insensible aux accents, filtres combinables par équipement et type, lecteur intégré, lien YouTube alternatif et lien direct partageable par vidéo (`#video-22`). Mise en page adaptée au mobile, navigation clavier et fermeture du lecteur par Échap.

Le catalogue est un instantané, pas une connexion en direct à Grist. Pour le mettre à jour, relire les données et les références en direct, appliquer les mêmes critères et remplacer le JSON dans le bloc `video-data` du fichier HTML. Ne jamais intégrer de clé API au site. Mettre aussi à jour la date visible.

## Mise en ligne GitHub Pages

Dépôt cible : https://github.com/mickaelmoh/video-webpage-html

1. Publier ces fichiers à la racine de la branche `main`.
2. Dans Settings → Pages, choisir « Deploy from a branch », puis `main` et `/ (root)`.
3. Dans « Custom domain », saisir `how-to.merveil-paris.com` et enregistrer AVANT de modifier le DNS actif.
4. Dans Cloudflare → domaine `merveil-paris.com` → DNS, ajouter l’entrée suivante en mode DNS only après vérification des éventuelles entrées existantes pour ce seul sous-domaine :

| Type | Sous-domaine | Cible |
| --- | --- | --- |
| CNAME | how-to | mickaelmoh.github.io. |

La cible ne comporte ni `https://`, ni chemin, ni nom du dépôt. Préserver les autres enregistrements du domaine. Le fichier `CNAME` fourni contient le domaine personnalisé.

5. Attendre la validation DNS et la disponibilité du certificat, puis activer « Enforce HTTPS » dans GitHub Pages.
6. Vérifier https://how-to.merveil-paris.com et un lien direct de vidéo.

Constat du 30 octobre 2026 dans OVH : les serveurs DNS actifs sont `john.ns.cloudflare.com` et `pearl.ns.cloudflare.com`. La zone DNS OVH affichée est inactive ; ne pas y ajouter cette entrée et ne pas changer les serveurs de noms.

Cette configuration conserve le sous-domaine Merveil dans la barre d’adresse. Aucun service de redirection OVH payant n’est nécessaire. La propagation DNS et la mise à disposition HTTPS peuvent prendre jusqu’à 24 heures.

Le site est public, accessible sans compte. `noindex` et `robots.txt` demandent aux moteurs de ne pas l’indexer ; ils ne constituent pas un contrôle d’accès. Une vidéo supprimée ou restreinte côté YouTube reste indisponible, même si sa fiche est marquée « Publiée » dans Grist.

Documentation : https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site
