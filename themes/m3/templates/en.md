---
title: {{basics.name}}'CV
...

####

##### {{basics.name}}

**Nationality:** {{basics.nationality.title()}}
**Year of birth:** {{basics.birthYear}}
**Gender:** {{basics.gender.title()}}

## About me

{{basics.summary}}

## Work experience

{% for job in work %}

### {{job.position}}

**_{{job.name}}_** [ {{job.startDate}} - {{job.endDate}} ]

{% if "location" in job %}City: {{job.location}}{% endif %}
{% if "country" in job %}Country: {{job.country}}{% endif %}
{% if "website" in job %}Website: [{{job.website.lstrip("https://")}}]({{job.website}}){% endif %}

{{job.summary}}
{% for highlight in job.highlights %}
{{highlight}}  
{% endfor %}

{% endfor %}

## Education and training

{% for school in education %}

### {{school.title}}

**_{{school.institution}}_** [ {{school.startDate}} - {{school.endDate}} ]

{% if "location" in school %}City: {{school.location}}{% endif %}
{% if "country" in school %}Country: {{school.country}}{% endif %}
{% if "website" in school %}Website: [{{school.url.lstrip("https://")}}]({{school.url}}){% endif %}
{% if "grade" in school %}Final grade: {{school.grade}}{% endif %}
{% if "credits" in school %}Number of credits: {{school.credits}}{% endif %}
{% if "thesis" in school %}Thesis: {{school.thesis}}{% endif %}

{{school.summary}}  
{% for highlight in school.highlights %}
{{highlight}}  
{% endfor %}

{% endfor %}

## Language skills

{% for language in languages %}
{% if language.fluency=="Native speaker" %}
Mother tongue(s): **{{language.language}}**
{% endif %}
{% endfor %}

**Other language(s):**

{% for language in languages %}
{% if language.fluency!="Native speaker" %}

### {{language.language}}

**LISTENING** {{language.fluency}} **READING** {{language.fluency}} **WRITING** {{language.fluency}}

**SPOKEN PRODUCTION** {{language.fluency}} **SPOKEN INTERACTION** {{language.fluency}}

{% endif %}
{% endfor %}

{% if driving is defined %}

## Driving licence

**Driving Licence:** AM

**Driving Licence:** B

{% endif %}

## Volunteering

{% for job in volunteer %}

### {{job.title}}

**_{{job.organization}}_** [ {{job.startDate}} - {{job.endDate}} ]

{% if "location" in job %}City: {{job.location}}  {% endif %}
{% if "country" in job %}Country: {{job.country}}{% endif %}
{% if "website" in job %}Website: [{{job.url.lstrip("https://")}}]({{job.url}}){% endif %}

{{job.summary}}  
{% for highlight in job.highlights %}
{{highlight}}  
{% endfor %}

{% endfor %}

##

I hereby authorize the use of my personal data in accordance to the GDPR 679/16 - "European regulation on the protection of personal data".
