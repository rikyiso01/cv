---
title: CV di {{basics.name}}
...

####

![picture]({{basics.image}})

##### {{basics.name}}

**Anno di nascita:** {{basics.birthYear}}

![icon](assets/icons/email.png) **Indirizzo mail:** [{{basics.email}}](mailto:{{basics.email}})

![icon](assets/icons/location.png) **Città:** {{basics.location.city}} {{basics.countryCode}}

{% for account in basics.profiles %}

![icon](assets/icons/{{account.network}}.png) **{{account.network.title()}}:** [{{account.url.removeprefix("https://")}}]({{account.url}})

{% endfor %}

## Riguardo a me

{{basics.summary}}

## Esperienza lavorativa

{% for job in work | sort(attribute='endDate', reverse=True) %}

### {{job.position}}

**_{{job.name}}_** [ {{job.startDate}} - {{job.endDate}} ]
{%- if "location" in job -%}, Città: {{job.location}}{% endif -%}
{%- if "country" in job -%}, Nazione: {{job.country}}{% endif -%}
{%- if "website" in job -%}, Sito: [{{job.website.removeprefix("https://")}}]({{job.website}}){% endif %}

{% if "summary" in job %}{{job.summary.strip()}}.  {% endif %}
{% if "highlights" in job -%}{% for highlight in job.highlights.values() %}{{highlight}}.  
{% endfor %}{%- endif -%}

{% endfor %}

## Formazione

{% for school in education | sort(attribute='endDate', reverse=True) %}

### {{school.title}}

**_{{school.institution}}_** [ {{school.startDate}} - {{school.endDate}} ]
{%- if "location" in school -%}, Città: {{school.location}}{% endif -%}
{%- if "url" in school -%}, Sito: [{{school.url.removeprefix("https://")}}]({{school.url}}){% endif %}

{% if "thesis" in school %}Tesi: {{school.thesis}}  {% endif %}
{% if "score" in school %}Voto finale: {{school.score}}{% endif %}
{% if "summary" in school %}{{school.summary.strip()}}.  {% endif %}
{% if "highlights" in school -%}{% for highlight in school.highlights.values() %}{{highlight.strip()}}.  
{% endfor %}{%- endif -%}

{% endfor %}

<br>

## Lingue

{% for language in languages %}

**{{language.language}}**: {{language.fluency}}

{% endfor %}

## Volontariato

{% for job in volunteer | sort(attribute="endDate", reverse=True)%}

### {{job.title}}

**_{{job.organization}}_** [ {{job.startDate}} - {{job.endDate}} ]
{% if "location" in job -%}, Città: {{job.location}}{% endif -%}
{% if "country" in job -%}, Nazione: {{job.country}}{% endif -%}
{% if "url" in job -%}, Sito: [{{job.url.removeprefix("https://")}}]({{job.url}}){% endif %}

{{job.summary.strip()}}.  
{% if "highlights" in job -%}{% for highlight in job.highlights.values() %}{{highlight}}.  
{% endfor %}{% endif -%}

{% endfor %}
