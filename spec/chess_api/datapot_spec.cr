require "spec"
require "base64"
require "./../../src/chess_api"

class ChessAPI
  describe Datapot do
    encoded = %(eyJkIjoie1wicmVzdWx0XCI6XCJPS1wiLFwidmFsaWRhdGlvbkZpZWxkXCI6bnVsbCxcIm1lc3NhZ2VcIjpudWxsLFwiZm9yd2FyZFVybFwiOm51bGwsXCJkYXRhXCI6XCJ7XFxcIm1zaXNkblxcXCI6XFxcIjU4MDAwNjAwNzE3N1xcXCIsXFxcInVucGFpZEludm9pY2VDb3VudFxcXCI6MCxcXFwiaXNBZG1pbmlzdHJhdG9yXFxcIjp0cnVlLFxcXCJhY3RpdmVDb3VudFxcXCI6MSxcXFwiYWN0aXZlUG9zdHBhaWRcXFwiOjEsXFxcImFjdGl2ZVByZXBhaWRcXFwiOjAsXFxcInByaWNlc1xcXCI6W3tcXFwiZGVzY3JpcHRpb25cXFwiOlxcXCJQZXIgTUJcXFwiLFxcXCJwcmljZVxcXCI6XFxcIjAqIGtyIHBlciBNQlxcXCJ9LHtcXFwiZGVzY3JpcHRpb25cXFwiOlxcXCJUYWxlXFxcIixcXFwicHJpY2VcXFwiOlxcXCJcXFwifSx7XFxcImRlc2NyaXB0aW9uXFxcIjpcXFwiU01TXFxcIixcXFwicHJpY2VcXFwiOlxcXCIwLDM5IGtyIHBlciBtZWxkaW5nXFxcIn0se1xcXCJkZXNjcmlwdGlvblxcXCI6XFxcIk1NU1xcXCIsXFxcInByaWNlXFxcIjpcXFwiMSw5OSBrciBwZXIgbWVsZGluZ1xcXCJ9XSxcXFwicG90U2FsZG9zXFxcIjpbXSxcXFwiaGFzRGFpbHlEYXRhUG90XFxcIjpmYWxzZSxcXFwiaGFzRGF0YVBvdFxcXCI6dHJ1ZSxcXFwiaGFzQ2FsbFBvdFxcXCI6ZmFsc2UsXFxcImhhc1NNU1BvdFxcXCI6ZmFsc2UsXFxcImhhc01NU1BvdFxcXCI6ZmFsc2UsXFxcImRhaWx5RGF0YVBvdFxcXCI6bnVsbCxcXFwiZGF0YVBvdFxcXCI6e1xcXCJ1c2VkXFxcIjoyLjEyODQ4OTA4ODI2NzA4NzkzNjQwMTM2NzE4NzUsXFxcInVzZWRQZXJjZW50XFxcIjo0MyxcXFwidXNlZFdpdGhVbml0XFxcIjpcXFwiMiwxR0JcXFwiLFxcXCJ1c2VkRGlzcGxheVxcXCI6XFxcIjIsMUdCIGF2IDVHQlxcXCIsXFxcImN1cnJlbnRCYWxhbmNlXFxcIjoyOTQwLjQyNzE3MzYxNDUwMTk1MzEyNSxcXFwic2l6ZVxcXCI6NS4wLFxcXCJzaXplV2l0aFVuaXRcXFwiOlxcXCI1R0JcXFwiLFxcXCJyZW5ld2FsRGF5c1xcXCI6MTIsXFxcIm5hbWVcXFwiOlxcXCJEYXRha3ZvdGVcXFwiLFxcXCJhbGlhc1xcXCI6XFxcIkRhdGFcXFwifSxcXFwiY2FuQnV5UG9zdHBhaWREYXRhXFxcIjp0cnVlLFxcXCJzYWxkb0Rpc3BsYXlcXFwiOlxcXCIwLC1cXFwiLFxcXCJpc1ByZXBhaWRcXFwiOmZhbHNlLFxcXCJyZWZpbGxNc2lzZG5cXFwiOlxcXCI1ODAwMDYwMDcxNzdcXFwiLFxcXCJyZWZpbGxUb2tlblxcXCI6XFxcIk5UZ3dNREEyTURBM01UYzNPakUwT1RjNE1qYzNNRFl3TURBNk9Ua3lPREF6UmtZM01ESXpSa1V3TVVWRFFUVkdNVGRDUlRJeE5EZ3dNekl4UmpZMk1UZzJSRE5ETnpWQk5USXpOakF6TmtRMU1qbEVORFZETVRWR1FRPT1cXFwifVwifSJ9)
    loadInitalData = Base64.decode_string(encoded)

    describe "#current_usage" do
      it "returns the current usage in GB" do
        Datapot.new(loadInitalData).current_usage.should eq 2.1
      end
    end

    describe "#current_size" do
      it "returns the current allowance in GB" do
        Datapot.new(loadInitalData).current_size.should eq 5
      end
    end
  end
end
