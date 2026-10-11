variable "data_safe_library_masking_formats" {
  description = <<EOT
Map of data_safe_library_masking_formats, attributes below
Required:
    - compartment_id
    - format_entries (block):
        - column_name (optional)
        - description (optional)
        - end_date (optional)
        - end_length (optional)
        - end_value (optional)
        - fixed_number (optional)
        - fixed_string (optional)
        - grouping_columns (optional)
        - length (optional)
        - library_masking_format_id (optional)
        - pattern (optional)
        - post_processing_function (optional)
        - random_list (optional)
        - regular_expression (optional)
        - replace_with (optional)
        - schema_name (optional)
        - sql_expression (optional)
        - start_date (optional)
        - start_length (optional)
        - start_position (optional)
        - start_value (optional)
        - table_name (optional)
        - type (required)
        - user_defined_function (optional)
Optional:
    - defined_tags
    - description
    - display_name
    - freeform_tags
    - sensitive_type_ids
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id     = string
    defined_tags       = optional(map(string))
    description        = optional(string)
    display_name       = optional(string)
    freeform_tags      = optional(map(string))
    sensitive_type_ids = optional(list(string))
    format_entries = list(object({
      column_name               = optional(string)
      description               = optional(string)
      end_date                  = optional(string)
      end_length                = optional(number)
      end_value                 = optional(number)
      fixed_number              = optional(number)
      fixed_string              = optional(string)
      grouping_columns          = optional(list(string))
      length                    = optional(number)
      library_masking_format_id = optional(string)
      pattern                   = optional(string)
      post_processing_function  = optional(string)
      random_list               = optional(list(string))
      regular_expression        = optional(string)
      replace_with              = optional(string)
      schema_name               = optional(string)
      sql_expression            = optional(string)
      start_date                = optional(string)
      start_length              = optional(number)
      start_position            = optional(number)
      start_value               = optional(number)
      table_name                = optional(string)
      type                      = string
      user_defined_function     = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.data_safe_library_masking_formats : (
        length(v.format_entries) >= 1
      )
    ])
    error_message = "Each format_entries list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_safe_library_masking_formats : (
        alltrue([for item in v.format_entries : (contains([for v in ["DELETE_ROWS", "DETERMINISTIC_ENCRYPTION", "DETERMINISTIC_ENCRYPTION_DATE", "DETERMINISTIC_SUBSTITUTION", "FIXED_NUMBER", "FIXED_STRING", "LIBRARY_MASKING_FORMAT", "NULL_VALUE", "PATTERN", "POST_PROCESSING_FUNCTION", "PRESERVE_ORIGINAL_DATA", "RANDOM_DATE", "RANDOM_DECIMAL_NUMBER", "RANDOM_DIGITS", "RANDOM_LIST", "RANDOM_NUMBER", "RANDOM_STRING", "RANDOM_SUBSTITUTION", "REGULAR_EXPRESSION", "SHUFFLE", "SQL_EXPRESSION", "SUBSTRING", "TRUNCATE_TABLE", "USER_DEFINED_FUNCTION"] : lower(v)], lower(item.type)))])
      )
    ])
    error_message = "must be one of: \"DELETE_ROWS\", \"DETERMINISTIC_ENCRYPTION\", \"DETERMINISTIC_ENCRYPTION_DATE\", \"DETERMINISTIC_SUBSTITUTION\", \"FIXED_NUMBER\", \"FIXED_STRING\", \"LIBRARY_MASKING_FORMAT\", \"NULL_VALUE\", \"PATTERN\", \"POST_PROCESSING_FUNCTION\", \"PRESERVE_ORIGINAL_DATA\", \"RANDOM_DATE\", \"RANDOM_DECIMAL_NUMBER\", \"RANDOM_DIGITS\", \"RANDOM_LIST\", \"RANDOM_NUMBER\", \"RANDOM_STRING\", \"RANDOM_SUBSTITUTION\", \"REGULAR_EXPRESSION\", \"SHUFFLE\", \"SQL_EXPRESSION\", \"SUBSTRING\", \"TRUNCATE_TABLE\", \"USER_DEFINED_FUNCTION\""
  }
}

