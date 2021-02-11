# frozen_string_literal: true

JWT_ERRORS = [
  JWT::DecodeError,
  JWT::ExpiredSignature,
  JWT::InvalidIssuerError,
  JWT::VerificationError,
].freeze
