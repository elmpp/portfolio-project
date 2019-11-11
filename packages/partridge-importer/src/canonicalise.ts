import slugify from 'slugify'

slugify.extend({'☢': 'radioactive'})

export const canonicalise = (raw: string): string => {
  return slugify(raw.replace(/[!@£$%^*&/\\]/g, '-'), {lower: true, remove: /[)(,]/g}).replace(/^-+|-+$/g, '')
}
