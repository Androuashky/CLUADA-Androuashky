SELECT employe.nom, service.nom
FROM employe
JOIN service ON service.id = employe.service_id

SELECT service.nom, COUNT(employe.nom)
FROM employe
JOIN service ON service.id = employe.service_id
GROUP BY service.nom

SELECT  SUM(prix_centimes)/100
FROM transaction_cafe

SELECT boisson, count(*) as "ordre"
FROM transaction_cafe
GROUP BY boisson
ORDER BY ordre DESC

SELECT employe.nom, employe.prenom, SUM(transaction_cafe.prix_centimes)/100 as "depensier"
FROM employe
JOIN transaction_cafe ON transaction_cafe.employe_id = employe.id
GROUP BY employe.nom, employe.prenom
ORDER BY depensier DESC

SELECT nom, prenom, AVG(nb_cafes_par_jour) as "moyenne_par_jour"
FROM (
    SELECT employe.nom, employe.prenom, DATE(transaction_cafe.horodatage) as "jour", COUNT(*) as "nb_cafes_par_jour"
    FROM employe
    JOIN transaction_cafe ON transaction_cafe.employe_id = employe.id
    GROUP BY DATE(transaction_cafe.horodatage), employe.nom, employe.prenom
) as "cafe_par_jour"
GROUP BY nom, prenom
HAVING AVG(nb_cafes_par_jour) >= 4

