$version: "2"

namespace com.gatcg

use aws.protocols#restJson1
use aws.api#service
use com.gatcg.cards#CardsResource

@restJson1
@service(sdkId: "gatcg")
service GATCGApi {
    version: "2024-11-11"
    resources: [
        CardsResource
    ]
}

list StringList {
    member: String
}
