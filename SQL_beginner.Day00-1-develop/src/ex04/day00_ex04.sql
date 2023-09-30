SELECT
concat(name,' (age:',age,',gender:''',gender,''',address:''',address,''')') person_information
FROM postgres.public.person
ORDER BY 1
