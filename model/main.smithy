$version: "2"

namespace com.gatcg

use aws.protocols#restJson1
use aws.api#service
use com.gatcg.card#Card

@restJson1
@service(sdkId: "gatcg")
service GATCGApi {
    version: "2024-11-11"
    resources: [
        Card
    ]
}

list StringList {
    member: String
}
