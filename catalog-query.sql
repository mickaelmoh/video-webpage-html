SELECT v.id, v.title, v.kind, v.audience, v.url, v.youtube_id AS youtubeId,
       v.language, v.is_active, t.label_fr AS equipment, t.family, v.element_models
FROM T3_D_Videos v
LEFT JOIN T3_A_ElementTypes t ON v.element_type = t.id
WHERE v.is_active = 1
  AND v.status = 'Publiée'
  AND v.url <> ''
  AND v.kind IN ('Utilisation', 'Dépannage')
ORDER BY v.id
