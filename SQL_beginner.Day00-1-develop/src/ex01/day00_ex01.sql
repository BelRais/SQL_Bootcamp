SELECT
name,
age
FROM postgres.public.person
WHERE address = 'Kazan' and gender = 'female'
ORDER BY name
