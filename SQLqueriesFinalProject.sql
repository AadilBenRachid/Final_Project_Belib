CREATE DATABASE IF NOT EXISTS Belib; 
USE Belib;

select * from belib_temps_reel;

SELECT * FROM belib_donnees_statiques;

#query1
# get all the charging station in the arrondissement 'Paris centre' 
select `Nom station` from belib_donnees_statiques
where Arrondissement = 'Paris centre';

#query2
# left join on two tables
SELECT *
FROM belib_donnees_statiques bds
LEFT JOIN belib_temps_reel btr
ON bds.`ID PDC local`= btr.`ID PDC local`;

#query3
# left join on two tables with a condition
SELECT Arrondissement_x, `Type de chargeur`
FROM belib_donnees_statiques bds
LEFT JOIN belib_points_de_recharge_clean bprc
USING (`ID PDC local`)
WHERE bprc.`Type de chargeur` = "Prise type 2" AND bprc.Arrondissement_x = "16e Arrondissement";


#query4
# count of 'Prise type EF' for each arrondissement
SELECT Arrondissement_x,`Type de chargeur`, COUNT(`ID PDC local_x`) AS count 
FROM belib_points_de_recharge_clean2 
GROUP BY Arrondissement_x ;

#query5
# i am looking for a charging station in the "17e Arrondissement" not occupied and not under maintenance not far from my office
SELECT `Statut du point de recharge`, Arrondissement, `Adresse station`
FROM belib_temps_reel btr
WHERE btr.`Statut du point de recharge`= 'Disponible' AND btr.Arrondissement= "17e Arrondissement";






