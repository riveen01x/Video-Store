require "test_helper"

class DailyDigestMailerTest < ActionMailer::TestCase
  test "digest_email" do
    mail = DailyDigestMailer.digest_email
    assert_equal "Digest email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
