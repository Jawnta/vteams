USE 'vteams'
INSERT INTO charging_zone
	(id, parking_zone_id, area)
VALUES
 ('kna_c_2', 'kna_2', ST_GeomFromGeoJSON('{"coordinates": [[[15.579506452331657, 56.16206749118757], [15.57999478446095, 56.16205036201086], [15.580037080944749, 56.16215527809851], [15.579525678005837, 56.16217240722841], [15.579506452331657, 56.16206749118757]]], "type": "Polygon"}')),
 ('kna_c_1', 'kna_1', ST_GeomFromGeoJSON('{"coordinates": [[[15.586683716507707, 56.16459508323922], [15.586895795345441, 56.16459276779966], [15.586902032957966, 56.164930820475035], [15.586698270937887, 56.164930820475035], [15.586683716507707, 56.16459508323922]]], "type": "Polygon"}')),
 ('kna_c_3', 'kna_3', ST_GeomFromGeoJSON('{"coordinates": [[[15.589998487096324, 56.18028431266032], [15.589953227007385, 56.180165555238716], [15.59024849520523, 56.18014156379553], [15.590282979082218, 56.18025912172291], [15.589998487096324, 56.18028431266032]]], "type": "Polygon"}')),
 ('sthlm_c_1', 'sthlm_1', ST_GeomFromGeoJSON('{"coordinates": [[[18.071491967716497, 59.31500471939182], [18.071546547600093, 59.31491440776378], [18.072128733027995, 59.31500471939182], [18.072050998042045, 59.31508068225742], [18.071491967716497, 59.31500471939182]]], "type": "Polygon"}')),
 ('sthlm_c_2', 'sthlm_2', ST_GeomFromGeoJSON('{"coordinates": [[[18.07123148585964, 59.34130365112898], [18.071093823998297, 59.34114478399823], [18.071930663211532, 59.340932344231646], [18.07209368383795, 59.341124463730154], [18.07123148585964, 59.34130365112898]]], "type": "Polygon"}')),
 ('sthlm_c_3', 'sthlm_3', ST_GeomFromGeoJSON('{"coordinates": [[[18.02120033569264, 59.3300001768973], [18.021724715903247, 59.329852600036446], [18.022203890923834, 59.33016158835497], [18.021724715903247, 59.33025151726304], [18.02120033569264, 59.3300001768973]]], "type": "Polygon"}')),
 ('jkpg_c_2', 'jkpg_2', ST_GeomFromGeoJSON('{"coordinates": [[[14.176204546896486, 57.78187531291721], [14.176069295404034, 57.781484723031866], [14.176520133710056, 57.781418622786845], [14.176685441089461, 57.7818232345098], [14.176204546896486, 57.78187531291721]]], "type": "Polygon"}')),
 ('jkpg_c_1', 'jkpg_1', ST_GeomFromGeoJSON('{"coordinates": [[[14.166144074899165, 57.783588111601716], [14.1661150131456, 57.78350483468199], [14.166481917785319, 57.78345448110235], [14.166540041292478, 57.7835493781742], [14.166144074899165, 57.783588111601716]]], "type": "Polygon"}'));
