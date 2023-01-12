import "package:dio/dio.dart";

class DioMockInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path.startsWith("https://api.luminews.my/dummy_news/")) {
      final mockResponse = Response(data: [
        {
          "news_title":
              "Best smartphones under RM600 (Dec 2022) | SoyaCincau’s Best Budget Buys",
          "publisher_name": "SoyaCincau",
          "image_url": "https://image.luminews.my/kk6s29dcb27bwr3v2yz6e9q9r6du",
          "publisher_image_url":
              "https://image.luminews.my/1gf54h7spaulkudx5tk7xo11ipsx",
          "publisher_rectangle_url":
              "https://image.luminews.my/dlz35jbg62dvqpqebz04s38n55k8",
          "updated": "4 minutes ago",
          "link":
              "https://soyacincau.com/2023/01/09/best-smartphones-under-rm600-dec-2022-soyacincaus-best-budget-buys/"
        },
        {
          "news_title":
              "Tian Chua says PKR did not handle his sacking professionally",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/s799yfr7vbdp7kb0u793n9sg8qti",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "9 minutes ago",
          "link":
              "https://www.nst.com.my/news/politics/2023/01/868575/tian-chua-says-pkr-did-not-handle-his-sacking-professionally"
        },
        {
          "news_title":
              "PM Anwar Ibrahim accorded official welcome by Indonesian president",
          "publisher_name": "Sinar Daily",
          "image_url": "https://image.luminews.my/hznkbpdb2glvvgcfislczws24tgw",
          "publisher_image_url":
              "https://image.luminews.my/4pzezu81wj0vw6wudfwelgkjdtzu",
          "publisher_rectangle_url":
              "https://image.luminews.my/x3ftcyp5wazqvgxg615x64rpfxyl",
          "updated": "12 minutes ago",
          "link":
              "https://www.sinardaily.my/article/187954/malaysia/national/pm-anwar-ibrahim-accorded-official-welcome-by-indonesian-president"
        },
        {
          "news_title":
              "The hotel prices in Mecca and Medina are beyond our control, says minister",
          "publisher_name": "Sinar Daily",
          "image_url": "https://image.luminews.my/5cruyd61u5eh4vuudvxje9tnfmcy",
          "publisher_image_url":
              "https://image.luminews.my/4pzezu81wj0vw6wudfwelgkjdtzu",
          "publisher_rectangle_url":
              "https://image.luminews.my/x3ftcyp5wazqvgxg615x64rpfxyl",
          "updated": "17 minutes ago",
          "link":
              "https://www.sinardaily.my/article/187952/malaysia/national/the-hotel-prices-in-mecca-and-medina-are-beyond-our-control-says-minister"
        },
        {
          "news_title": "Johoreans urged to get second booster - MB",
          "publisher_name": "Sinar Daily",
          "image_url": "https://image.luminews.my/nv7meri5xaaqcurrmdwt607nsq3v",
          "publisher_image_url":
              "https://image.luminews.my/4pzezu81wj0vw6wudfwelgkjdtzu",
          "publisher_rectangle_url":
              "https://image.luminews.my/x3ftcyp5wazqvgxg615x64rpfxyl",
          "updated": "17 minutes ago",
          "link":
              "https://www.sinardaily.my/article/187953/malaysia/national/johoreans-urged-to-get-second-booster---mb"
        },
        {
          "news_title": "Delhi fog delays flights, cold wave closes schools",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/xov0mmxm0u4m9eaat7ufu3bd5nm7",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "18 minutes ago",
          "link":
              "https://www.freemalaysiatoday.com/category/world/2023/01/09/delhi-fog-delays-flights-cold-wave-closes-schools/"
        },
        {
          "news_title":
              "Base judgments on law, not to seek popularity, CJ reminds judges",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/dgfcijed0atfuyfvhqugsic86xd1",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "21 minutes ago",
          "link":
              "https://www.freemalaysiatoday.com/category/nation/2023/01/09/base-judgments-on-law-not-to-seek-popularity-cj-reminds-judges/"
        },
        {
          "news_title": "Aviation sector set for profitability in 2023",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/44h0grx3mb5tijsyxis4pycaln7w",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "23 minutes ago",
          "link":
              "https://www.freemalaysiatoday.com/category/business/2023/01/09/aviation-sector-set-for-profitability-in-2023/"
        },
        {
          "news_title":
              "Electric cars: Chinese Tesla rivals stand to benefit as budget-cautious consumers opt for cheaper models in 2023",
          "publisher_name": "South China Morning Post",
          "image_url": "https://image.luminews.my/ce97ag2nw5hdnc4wycsilw4lp0hv",
          "publisher_image_url":
              "https://image.luminews.my/c1tb5x8fn5j5brchdqsuv6j5x6ta",
          "publisher_rectangle_url":
              "https://image.luminews.my/acu9yvbwmw6sfidwnyokt3n5t5rl",
          "updated": "23 minutes ago",
          "link":
              "https://www.scmp.com/business/china-business/article/3206069/electric-cars-chinese-tesla-rivals-stand-benefit-budget-cautious-consumers-opt-cheaper-models-2023?utm_source=rss_feed"
        },
        {
          "news_title":
              "Microsoft Might Be Bringing Viral AI Chatbot ChatGPT to Word, PowerPoint, and Excel",
          "publisher_name": "Mashable Southeast Asia",
          "image_url": "https://image.luminews.my/qhodpppskglrwt3djmnjde1gcrg6",
          "publisher_image_url":
              "https://image.luminews.my/plq0xzaw5hl1rcxy3kpkcbmuwg30",
          "publisher_rectangle_url":
              "https://image.luminews.my/5yb77nb9c8pgdi0hdoio2m5nm9np",
          "updated": "24 minutes ago",
          "link":
              "https://sea.mashable.com/tech/22234/microsoft-might-be-bringing-viral-ai-chatbot-chatgpt-to-word-powerpoint-and-excel"
        },
        {
          "news_title":
              "#Showbiz: Prepare yourself mentally and physically, Rita Rudaini advises Puteri Sarah",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/0w63hn9jdo9sgnzcwmznt33erkh3",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "27 minutes ago",
          "link":
              "https://www.nst.com.my/lifestyle/groove/2023/01/868573/showbiz-prepare-yourself-mentally-and-physically-rita-rudaini"
        },
        {
          "news_title":
              "Anwar told me to help PH in upcoming state polls, says Maszlee",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/v0tcmvzkza70my4ztyb7de17zouf",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "29 minutes ago",
          "link":
              "https://www.freemalaysiatoday.com/category/nation/2023/01/09/anwar-told-me-to-help-ph-in-upcoming-state-polls-says-maszlee/"
        },
        {
          "news_title":
              "[Watch] Girl Shamed For Calling Charles & Keith Bag A Luxury Brand Talks About Privilege",
          "publisher_name": "The Rakyat Post",
          "image_url": "https://image.luminews.my/7eltjnxtcqmgknr89vqjo0hz259e",
          "publisher_image_url":
              "https://image.luminews.my/fyd6tnm764q1b7w39z2fh10yl8nu",
          "publisher_rectangle_url":
              "https://image.luminews.my/dcjibihy3jn5baph5jnuzvvuipws",
          "updated": "30 minutes ago",
          "link":
              "https://www.therakyatpost.com/news/2023/01/09/watch-girl-shamed-for-calling-charles-keith-bag-a-luxury-brand-talks-about-privilege/"
        },
        {
          "news_title":
              "Oil advances at start of week on optimistic demand outlook",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/dallhg71aymfym4iyg03ec1k6koq",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "31 minutes ago",
          "link":
              "https://www.freemalaysiatoday.com/category/business/2023/01/09/oil-advances-at-start-of-week-on-optimistic-demand-outlook/"
        },
        {
          "news_title":
              "Players could play at Australian Open with COVID - Tiley",
          "publisher_name": "CNA",
          "image_url": "https://image.luminews.my/y2tz5bfmfu65vc6szh080gwxsqzz",
          "publisher_image_url":
              "https://image.luminews.my/ri79f6aswedmhwlesbgxhz7734w8",
          "publisher_rectangle_url":
              "https://image.luminews.my/lqqh20aaxlspw8wgdrnwapm9lgap",
          "updated": "34 minutes ago",
          "link":
              "https://www.channelnewsasia.com/sport/players-could-play-australian-open-covid-tiley-3192136"
        },
        {
          "news_title":
              "Fans sitting at staircase, smuggling laser pointers at AFF Cup semifinal, in violation of safety rules",
          "publisher_name": "Twentytwo13",
          "image_url": "https://image.luminews.my/q4dtem7sbkhirjoscjld24k0fmfq",
          "publisher_image_url":
              "https://image.luminews.my/zv912aa84otxnswv7kvgq2a2yl0k",
          "publisher_rectangle_url":
              "https://image.luminews.my/6eh0heg5mrez6kuxq4cmqwk0uuzt",
          "updated": "37 minutes ago",
          "link":
              "https://twentytwo13.my/sports/fans-sitting-at-staircase-smuggling-laser-pointers-at-aff-cup-semifinal-in-violation-of-safety-rules/?utm_source=rss&utm_medium=rss&utm_campaign=fans-sitting-at-staircase-smuggling-laser-pointers-at-aff-cup-semifinal-in-violation-of-safety-rules"
        },
        {
          "news_title":
              "PM Anwar Ibrahim accorded official welcome by Indonesian President",
          "publisher_name": "The Malaysian Reserve",
          "image_url": "https://image.luminews.my/7zt8l2hbwqn0ezg7e1or38rh0mbf",
          "publisher_image_url":
              "https://image.luminews.my/r0umhz9dkk0q9nrcp5izrarl08k9",
          "publisher_rectangle_url":
              "https://image.luminews.my/nv3vj8tzhixqzakuxyz9z1tw3o4z",
          "updated": "38 minutes ago",
          "link":
              "https://themalaysianreserve.com/2023/01/09/pm-anwar-ibrahim-accorded-official-welcome-by-indonesian-president/"
        },
        {
          "news_title": "Brasilia governor removed over pro-Bolsonaro riots",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/x3bwdcms5aezmfjwiloqffh9f6c7",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "39 minutes ago",
          "link":
              "https://www.freemalaysiatoday.com/category/world/2023/01/09/brasilia-governor-removed-for-90-days/"
        },
        {
          "news_title":
              "Give road safety attention as urgent as Covid-19: UN special envoy tells govt",
          "publisher_name": "The Vibes",
          "image_url": "https://image.luminews.my/3u4rbwv80rvfqhx1hspz4jx5wwks",
          "publisher_image_url":
              "https://image.luminews.my/6s8zdom3g1ybn8psl194bno7sd5n",
          "publisher_rectangle_url":
              "https://image.luminews.my/t7nf0vxw9xvmphhcy6y9klji1vkk",
          "updated": "39 minutes ago",
          "link":
              "https://www.thevibes.com/articles/news/82322/give-road-safety-attention-as-urgent-as-covid-19-un-special-envoy-tells-govt"
        },
        {
          "news_title":
              "Prasarana to spend RM2.8bil to improve train, bus services",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/qdjjpiu6syxnzh66dyadk127vxa9",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "41 minutes ago",
          "link":
              "https://www.freemalaysiatoday.com/category/nation/2023/01/09/prasarana-to-spend-rm2-8bil-to-improve-train-bus-services/"
        },
        {
          "news_title":
              "Dredging works near Kuala Perlis jetty terminal to delay for another four months",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/8ki1frj4r06wzdl135gopax3vqi7",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "47 minutes ago",
          "link":
              "https://www.nst.com.my/news/nation/2023/01/868571/dredging-works-near-kuala-perlis-jetty-terminal-delay-another-four-months"
        },
        {
          "news_title": "It is better to postpone Umrah than to go into debt",
          "publisher_name": "Sinar Daily",
          "image_url": "https://image.luminews.my/zjfn2clkk430em6mj2pi4gyv5tdb",
          "publisher_image_url":
              "https://image.luminews.my/4pzezu81wj0vw6wudfwelgkjdtzu",
          "publisher_rectangle_url":
              "https://image.luminews.my/x3ftcyp5wazqvgxg615x64rpfxyl",
          "updated": "48 minutes ago",
          "link":
              "https://www.sinardaily.my/article/187949/malaysia/national/it-is-better-to-postpone-umrah-than-to-go-into-debt"
        },
        {
          "news_title":
              "Malaysia to raise umrah package price increase issue with Saudi Arabian govt",
          "publisher_name": "The Malaysian Reserve",
          "image_url": "https://image.luminews.my/grxbb0svmqmel5mtgi2b31izxvdd",
          "publisher_image_url":
              "https://image.luminews.my/r0umhz9dkk0q9nrcp5izrarl08k9",
          "publisher_rectangle_url":
              "https://image.luminews.my/nv3vj8tzhixqzakuxyz9z1tw3o4z",
          "updated": "51 minutes ago",
          "link":
              "https://themalaysianreserve.com/2023/01/09/malaysia-to-raise-umrah-package-price-increase-issue-with-saudi-arabian-govt/"
        },
        {
          "news_title":
              "Citigroup expects US Fed to raise rates near 5.5% by May",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/t86m6et8ol0hnjh5rxtg4okdkz93",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "54 minutes ago",
          "link":
              "https://www.freemalaysiatoday.com/category/business/2023/01/09/citigroup-expects-us-fed-to-raise-rates-near-5-5-by-may/"
        },
        {
          "news_title":
              "This Cat ‘Buys’ Fish With Leaves, But Some Are Not Buying The Story",
          "publisher_name": "The Rakyat Post",
          "image_url": "https://image.luminews.my/nuom8hca6una1n7bjeb29ztb9itv",
          "publisher_image_url":
              "https://image.luminews.my/fyd6tnm764q1b7w39z2fh10yl8nu",
          "publisher_rectangle_url":
              "https://image.luminews.my/dcjibihy3jn5baph5jnuzvvuipws",
          "updated": "57 minutes ago",
          "link":
              "https://www.therakyatpost.com/fun/2023/01/09/this-cat-buys-fish-with-leaves-but-some-are-not-buying-the-story/"
        },
        {
          "news_title": "Collins finds form in Adelaide warm-up",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/s8nu97s55tckupwotvnykv1mah15",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "1 hour ago",
          "link":
              "https://www.freemalaysiatoday.com/category/sports/2023/01/09/collins-finds-form-in-adelaide-warm-up/"
        },
        {
          "news_title":
              "Chung Hua Primary School No. 5 to hold e-waste campaign for charity",
          "publisher_name": "The Borneo Post",
          "image_url": "https://image.luminews.my/z97grqgp9jmimqxge5uws8ho48kr",
          "publisher_image_url":
              "https://image.luminews.my/ko52gau8d5hsnipyc1g9tu8ibox4",
          "publisher_rectangle_url":
              "https://image.luminews.my/dj1u667yq78wjhqr5mgu8vja7dbw",
          "updated": "1 hour ago",
          "link":
              "https://www.theborneopost.com/2023/01/09/chung-hua-primary-school-no-5-to-hold-e-waste-campaign-for-charity/"
        },
        {
          "news_title": "Sibuti man in Miri fined RM2,000 for drug abuse",
          "publisher_name": "The Borneo Post",
          "image_url": "https://image.luminews.my/fqj8jn7vio0hqy1pm11zkp4ahjof",
          "publisher_image_url":
              "https://image.luminews.my/ko52gau8d5hsnipyc1g9tu8ibox4",
          "publisher_rectangle_url":
              "https://image.luminews.my/dj1u667yq78wjhqr5mgu8vja7dbw",
          "updated": "1 hour ago",
          "link":
              "https://www.theborneopost.com/2023/01/09/sibuti-man-in-miri-fined-rm2000-for-drug-abuse/"
        },
        {
          "news_title":
              "China's new Covid test protocol of travellers from abroad to determine variants",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/pdwcthncmr3wbluta8ztfbpkpfb2",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "1 hour ago",
          "link":
              "https://www.nst.com.my/world/world/2023/01/868567/chinas-new-covid-test-protocol-travellers-abroad-determine-variants"
        },
        {
          "news_title":
              "Ex-NGO chairman, treasurer remanded to assist false claim probe",
          "publisher_name": "The Malaysian Reserve",
          "image_url": "https://image.luminews.my/1efmqp0lasrp61scasd99y8xot1n",
          "publisher_image_url":
              "https://image.luminews.my/r0umhz9dkk0q9nrcp5izrarl08k9",
          "publisher_rectangle_url":
              "https://image.luminews.my/nv3vj8tzhixqzakuxyz9z1tw3o4z",
          "updated": "1 hour ago",
          "link":
              "https://themalaysianreserve.com/2023/01/09/ex-ngo-chairman-treasurer-remanded-to-assist-false-claim-probe/"
        },
        {
          "news_title":
              "[VIDEO] Grandma Gets Red Carpet Welcome From Family After Being Separated For 3 Years",
          "publisher_name": "SAYS",
          "image_url": "https://image.luminews.my/9hzo47ipwegqnxn9gh2vafydg31d",
          "publisher_image_url":
              "https://image.luminews.my/ka0k8qfpbza9l2b1zr6pnveed7qe",
          "publisher_rectangle_url":
              "https://image.luminews.my/lemd96w8l5h435lg4e9z4ecndeda",
          "updated": "1 hour ago",
          "link":
              "https://says.com/my/news/grandmother-red-carpet-welcome-separated-family-3-years"
        },
        {
          "news_title": "Taiwan slams Beijing for latest combat drills",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/ud3mzcvl6exdo2w2w2kg3kejzenu",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "1 hour ago",
          "link":
              "https://www.freemalaysiatoday.com/category/world/2023/01/09/taiwan-slams-beijing-for-latest-combat-drills/"
        },
        {
          "news_title":
              "Nokia 5710 XpressAudio 4G Malaysia: There’s a pair of wireless earbuds built-in with this phone",
          "publisher_name": "SoyaCincau",
          "image_url": "https://image.luminews.my/dqia6vvagc3qz0qver3aqvrgoz5y",
          "publisher_image_url":
              "https://image.luminews.my/1gf54h7spaulkudx5tk7xo11ipsx",
          "publisher_rectangle_url":
              "https://image.luminews.my/dlz35jbg62dvqpqebz04s38n55k8",
          "updated": "1 hour ago",
          "link":
              "https://soyacincau.com/2023/01/09/nokia-5710-xpressaudio-4g-malaysia-theres-a-pair-of-wireless-earbuds-built-in-with-this-phone/"
        },
        {
          "news_title":
              "Virus wave slowing China’s efforts to secure power for rebound",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/t6ubvfnhmrc1v34mkogiunqeria4",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "1 hour ago",
          "link":
              "https://www.freemalaysiatoday.com/category/business/2023/01/09/virus-wave-slowing-chinas-efforts-to-secure-power-for-rebound/"
        },
        {
          "news_title":
              "Prasarana allocated RM2.8b to improve train, bus services",
          "publisher_name": "The Malaysian Reserve",
          "image_url": "https://image.luminews.my/zafbovekf3np9l3va03qh9w4bhcy",
          "publisher_image_url":
              "https://image.luminews.my/r0umhz9dkk0q9nrcp5izrarl08k9",
          "publisher_rectangle_url":
              "https://image.luminews.my/nv3vj8tzhixqzakuxyz9z1tw3o4z",
          "updated": "1 hour ago",
          "link":
              "https://themalaysianreserve.com/2023/01/09/prasarana-allocated-rm2-8b-to-improve-train-bus-services/"
        },
        {
          "news_title":
              "Taylor Swift’s Cat Is Crowned World’s Third-Richest Pet With A Total Net Worth of \$97 Million",
          "publisher_name": "JUICE",
          "image_url": "https://image.luminews.my/nk8gpy0ni2a650ziyrx7gtkzqfja",
          "publisher_image_url":
              "https://image.luminews.my/a40swmjch81tbkhkc7go8be58wvn",
          "publisher_rectangle_url":
              "https://image.luminews.my/tz76zdlqi73qqvez5gm178s3uzch",
          "updated": "1 hour ago",
          "link":
              "https://juiceonline.com/taylor-swifts-cat-crowned-worlds-third-richest-pet-net-worth-97-million/"
        },
        {
          "news_title":
              "Ewon to take over as Upko president at party convention",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/ctgsf4xre5ij820u8i8fea5c527z",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "1 hour ago",
          "link":
              "https://www.freemalaysiatoday.com/category/nation/2023/01/09/ewon-to-take-over-as-upko-president-at-party-convention/"
        },
        {
          "news_title": "Anwar arrives at Istana Bogor for visit with Jokowi",
          "publisher_name": "The Vibes",
          "image_url": "https://image.luminews.my/8mo3wjaho80u62q7hgy3ixwfeyhq",
          "publisher_image_url":
              "https://image.luminews.my/6s8zdom3g1ybn8psl194bno7sd5n",
          "publisher_rectangle_url":
              "https://image.luminews.my/t7nf0vxw9xvmphhcy6y9klji1vkk",
          "updated": "1 hour ago",
          "link":
              "https://www.thevibes.com/articles/news/82320/anwar-arrives-at-istana-bogor-for-visit-with-jokowi"
        },
        {
          "news_title":
              "Zaliha To Visit Oxford University On Future Of Malaysia’s Health Care System",
          "publisher_name": "CodeBlue",
          "image_url": "https://image.luminews.my/2na0nriue0lztb86uvuz29u142ie",
          "publisher_image_url":
              "https://image.luminews.my/596r0g3nuo374ch14c8l20nssv2i",
          "publisher_rectangle_url":
              "https://image.luminews.my/o77x30f84ddlsf3vdjd8ipic3age",
          "updated": "1 hour ago",
          "link":
              "https://codeblue.galencentre.org/2023/01/09/zaliha-to-visit-oxford-university-on-future-of-malaysias-health-care-system/"
        },
        {
          "news_title":
              "Very unprofessional, disrespectful behavior' - Tian Chua",
          "publisher_name": "Sinar Daily",
          "image_url": "https://image.luminews.my/9oe47106346xk9yb173lzufiuxhb",
          "publisher_image_url":
              "https://image.luminews.my/4pzezu81wj0vw6wudfwelgkjdtzu",
          "publisher_rectangle_url":
              "https://image.luminews.my/x3ftcyp5wazqvgxg615x64rpfxyl",
          "updated": "1 hour ago",
          "link":
              "https://www.sinardaily.my/article/187948/malaysia/politics/very-unprofessional-disrespectful-behavior---tian-chua"
        },
        {
          "news_title":
              "Foreign investors net buyers in Bursa’s opening week for 2023",
          "publisher_name": "The Malaysian Reserve",
          "image_url": "https://image.luminews.my/4obnfwqocul7spvh3gjnppg5wlsq",
          "publisher_image_url":
              "https://image.luminews.my/r0umhz9dkk0q9nrcp5izrarl08k9",
          "publisher_rectangle_url":
              "https://image.luminews.my/nv3vj8tzhixqzakuxyz9z1tw3o4z",
          "updated": "1 hour ago",
          "link":
              "https://themalaysianreserve.com/2023/01/09/foreign-investors-net-buyers-in-bursas-opening-week-for-2023/"
        },
        {
          "news_title":
              "In Jakarta, PM Anwar vows no compromise in war on graft even at risk to self",
          "publisher_name": "The Borneo Post",
          "image_url": "https://image.luminews.my/3xwd8qbuc78smx7t1b6lqot7857y",
          "publisher_image_url":
              "https://image.luminews.my/ko52gau8d5hsnipyc1g9tu8ibox4",
          "publisher_rectangle_url":
              "https://image.luminews.my/dj1u667yq78wjhqr5mgu8vja7dbw",
          "updated": "1 hour ago",
          "link":
              "https://www.theborneopost.com/2023/01/09/in-jakarta-pm-anwar-vows-no-compromise-in-war-on-graft-even-at-risk-to-self/"
        },
        {
          "news_title":
              "The vivo X90 series is coming to Malaysia soon, date to be announced",
          "publisher_name": "TechNave",
          "image_url": "https://image.luminews.my/nwwjz85fwnsgomx8jllb5hj5j661",
          "publisher_image_url":
              "https://image.luminews.my/21eaac4t1vf2iesdatu940xcvb6y",
          "publisher_rectangle_url":
              "https://image.luminews.my/ro6edlgelkrtz2r5go7ssts7nufz",
          "updated": "1 hour ago",
          "link":
              "https://technave.com/gadget/The-vivo-X90-series-is-coming-to-Malaysia-soon-date-to-be-announced-33047.html"
        },
        {
          "news_title":
              "Soaring prices force Philippines to plan import of onions as inflation makes vegetable costlier than beef",
          "publisher_name": "South China Morning Post",
          "image_url": "https://image.luminews.my/vq88byukkl2b8w00n2xqvemdiusf",
          "publisher_image_url":
              "https://image.luminews.my/c1tb5x8fn5j5brchdqsuv6j5x6ta",
          "publisher_rectangle_url":
              "https://image.luminews.my/acu9yvbwmw6sfidwnyokt3n5t5rl",
          "updated": "1 hour ago",
          "link":
              "https://www.scmp.com/news/asia/southeast-asia/article/3206059/philippines-import-months-worth-onions-pull-down-prices-inflation-makes-vegetable-costlier-beef?utm_source=rss_feed"
        },
        {
          "news_title":
              "Lutong man stunned to find 3-metre python dropping into kitchen",
          "publisher_name": "The Borneo Post",
          "image_url": "https://image.luminews.my/gio5njnauuqoxnocx06oyux7otzd",
          "publisher_image_url":
              "https://image.luminews.my/ko52gau8d5hsnipyc1g9tu8ibox4",
          "publisher_rectangle_url":
              "https://image.luminews.my/dj1u667yq78wjhqr5mgu8vja7dbw",
          "updated": "1 hour ago",
          "link":
              "https://www.theborneopost.com/2023/01/09/lutong-man-stunned-to-find-3-metre-python-dropping-into-kitchen/"
        },
        {
          "news_title":
              "Will Tibetans’ ‘middle way’ China approach preserve peace in Himalayan region?",
          "publisher_name": "South China Morning Post",
          "image_url": "https://image.luminews.my/1u2prqzo45g2l5r52ndg2cbigmdn",
          "publisher_image_url":
              "https://image.luminews.my/c1tb5x8fn5j5brchdqsuv6j5x6ta",
          "publisher_rectangle_url":
              "https://image.luminews.my/acu9yvbwmw6sfidwnyokt3n5t5rl",
          "updated": "1 hour ago",
          "link":
              "https://www.scmp.com/week-asia/people/article/3205819/will-tibetans-middle-way-china-approach-preserve-peace-himalayan-region?utm_source=rss_feed"
        },
        {
          "news_title":
              "New movie turns spotlight on France's forgotten colonial troops",
          "publisher_name": "The Vibes",
          "image_url": "https://image.luminews.my/c11wll34pmysv8vn43vfi6itxuyw",
          "publisher_image_url":
              "https://image.luminews.my/6s8zdom3g1ybn8psl194bno7sd5n",
          "publisher_rectangle_url":
              "https://image.luminews.my/t7nf0vxw9xvmphhcy6y9klji1vkk",
          "updated": "1 hour ago",
          "link":
              "https://www.thevibes.com/articles/culture/82318/new-movie-turns-spotlight-on-frances-forgotten-colonial-troops"
        },
        {
          "news_title":
              "Religious Affairs Minister: Malaysia to raise umrah package price increase issue with Saudi Arabian govt",
          "publisher_name": "The Borneo Post",
          "image_url": "https://image.luminews.my/qjqvdintxt7dxgqjak4e99uv2ojg",
          "publisher_image_url":
              "https://image.luminews.my/ko52gau8d5hsnipyc1g9tu8ibox4",
          "publisher_rectangle_url":
              "https://image.luminews.my/dj1u667yq78wjhqr5mgu8vja7dbw",
          "updated": "1 hour ago",
          "link":
              "https://www.theborneopost.com/2023/01/09/religious-affairs-minister-malaysia-to-raise-umrah-package-price-increase-issue-with-saudi-arabian-govt/"
        },
        {
          "news_title":
              "Tian Chua slams PKR for announcing sacking to media first",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/504ottp3yrc0nhwv2lbpq856rt6c",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "1 hour ago",
          "link":
              "https://www.freemalaysiatoday.com/category/nation/2023/01/09/tian-chua-slams-pkr-for-announcing-his-sacking-to-media-first/"
        },
        {
          "news_title":
              "Delivery Company Vows To Help Cancer Patient Deliver 5 Years Worth Of Gifts To Loved Ones",
          "publisher_name": "SAYS",
          "image_url": "https://image.luminews.my/c7ypo7bz065927pci934cgv514c9",
          "publisher_image_url":
              "https://image.luminews.my/ka0k8qfpbza9l2b1zr6pnveed7qe",
          "publisher_rectangle_url":
              "https://image.luminews.my/lemd96w8l5h435lg4e9z4ecndeda",
          "updated": "1 hour ago",
          "link":
              "https://says.com/my/news/delivery-company-help-cancer-patient-send-gifts-to-loved-ones"
        },
        {
          "news_title": "Goldman Sachs to cut 3,200 jobs: Source",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/iesp6d8zc8srrmvazoswob22g5b0",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "1 hour ago",
          "link":
              "https://www.nst.com.my/world/world/2023/01/868565/goldman-sachs-cut-3200-jobs-source"
        },
        {
          "news_title":
              "China to collect, analyse Covid-19 test samples of travelers from abroad to determine variants",
          "publisher_name": "Sinar Daily",
          "image_url": "https://image.luminews.my/r2gro94rovsjnvymjrcg3psas8i3",
          "publisher_image_url":
              "https://image.luminews.my/4pzezu81wj0vw6wudfwelgkjdtzu",
          "publisher_rectangle_url":
              "https://image.luminews.my/x3ftcyp5wazqvgxg615x64rpfxyl",
          "updated": "1 hour ago",
          "link":
              "https://www.sinardaily.my/article/187947/world/news/china-to-collect-analyse-covid-19-test-samples-of-travellers-from-abroad-to-determine-variants"
        },
        {
          "news_title":
              "Shipping giant Evergreen gives mega 50-month bonuses to staff",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/py71ur3c81f39ahtacom7z1e9o7l",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "1 hour ago",
          "link":
              "https://www.freemalaysiatoday.com/category/business/2023/01/09/shipping-giant-evergreen-gives-mega-50-month-bonuses-to-staff/"
        },
        {
          "news_title": "Malaysia's O&G sector to stay robust in 2023",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/lez2tb4nw8es12pbkw2xb6llrfe4",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "1 hour ago",
          "link":
              "https://www.nst.com.my/business/2023/01/868563/malaysias-og-sector-stay-robust-2023"
        },
        {
          "news_title":
              "RM1,000 compound ridiculous, does not make sense, MPK told",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/3galoboqffqvpwyf8p0kcjtda9n8",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "1 hour ago",
          "link":
              "https://www.nst.com.my/news/nation/2023/01/868561/rm1000-compound-ridiculous-does-not-make-sense-mpk-told"
        },
        {
          "news_title": "Joko Widodo accords warm welcome to Anwar",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/a1sbub68clcz883nv7t29px5cxvs",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "1 hour ago",
          "link":
              "https://www.nst.com.my/news/nation/2023/01/868559/joko-widodo-accords-warm-welcome-anwar"
        },
        {
          "news_title": "Is the U.S. getting closer to banning TikTok?",
          "publisher_name": "SoyaCincau",
          "image_url": "https://image.luminews.my/7ywc5kkcy52ykpujvb942x7516y5",
          "publisher_image_url":
              "https://image.luminews.my/1gf54h7spaulkudx5tk7xo11ipsx",
          "publisher_rectangle_url":
              "https://image.luminews.my/dlz35jbg62dvqpqebz04s38n55k8",
          "updated": "1 hour ago",
          "link":
              "https://soyacincau.com/2023/01/09/is-the-u-s-getting-closer-to-banning-tiktok/"
        },
        {
          "news_title":
              "Asian Film Awards 2023 nominations: Decision to Leave, Drive My Car lead race; Hong Kong cinema represented by five movies",
          "publisher_name": "South China Morning Post",
          "image_url": "https://image.luminews.my/7bu13js0jjkdc5uhva0yw1403r5n",
          "publisher_image_url":
              "https://image.luminews.my/c1tb5x8fn5j5brchdqsuv6j5x6ta",
          "publisher_rectangle_url":
              "https://image.luminews.my/acu9yvbwmw6sfidwnyokt3n5t5rl",
          "updated": "1 hour ago",
          "link":
              "https://www.scmp.com/lifestyle/entertainment/article/3206060/asian-film-awards-2023-nominations-decision-leave-drive-my-car-lead-race-hong-kong-cinema?utm_source=rss_feed"
        },
        {
          "news_title":
              "MCMC: We Didn’t Send You Any Emails Or Messages Claiming That You Won A Cash Prize",
          "publisher_name": "TRP Tech",
          "image_url": "https://image.luminews.my/hib1dlidw89ludoe4nf6hsre3a78",
          "publisher_image_url":
              "https://image.luminews.my/tl3q1lp8hkv7a5u5vgvmu29skk76",
          "publisher_rectangle_url":
              "https://image.luminews.my/1ftedid52nn7h956fsvgy23mevl4",
          "updated": "1 hour ago",
          "link":
              "https://techtrp.com/news/2023/01/09/mcmc-we-didnt-send-you-any-emails-or-messages-claiming-that-you-won-a-cash-prize/"
        },
        {
          "news_title":
              "#TECH: Local company creates educational drone to promote STEM concepts in children",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/yj7pqhdti5u69p2i9j8lh11549tq",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "1 hour ago",
          "link":
              "https://www.nst.com.my/lifestyle/bots/2023/01/868557/tech-local-company-creates-educational-drone-promote-stem-concepts"
        },
        {
          "news_title":
              "[Watch] 6 Men Arrested For Fighting And Damaging Car In Miri Mall Parking Lot",
          "publisher_name": "The Rakyat Post",
          "image_url": "https://image.luminews.my/d2udq8s9kakr1y635dm2huhqpf5h",
          "publisher_image_url":
              "https://image.luminews.my/fyd6tnm764q1b7w39z2fh10yl8nu",
          "publisher_rectangle_url":
              "https://image.luminews.my/dcjibihy3jn5baph5jnuzvvuipws",
          "updated": "1 hour ago",
          "link":
              "https://www.therakyatpost.com/news/2023/01/09/watch-6-men-arrested-for-fighting-and-damaging-car-in-miri-mall-parking-lot/"
        },
        {
          "news_title":
              "Focus continues at Istana Seri Kinabalu, Sri Gaya on Sabah’s political situation",
          "publisher_name": "The Malaysian Reserve",
          "image_url": "https://image.luminews.my/bora1oa7pilga0ekn2d3srcidtjg",
          "publisher_image_url":
              "https://image.luminews.my/r0umhz9dkk0q9nrcp5izrarl08k9",
          "publisher_rectangle_url":
              "https://image.luminews.my/nv3vj8tzhixqzakuxyz9z1tw3o4z",
          "updated": "1 hour ago",
          "link":
              "https://themalaysianreserve.com/2023/01/09/focus-continues-at-istana-seri-kinabalu-sri-gaya-on-sabahs-political-situation/"
        },
        {
          "news_title":
              "Consumers' Association: Please Don't Buy Rabbits As Pets Just For CNY This Year",
          "publisher_name": "SAYS",
          "image_url": "https://image.luminews.my/pbag8b7tot3u62x2kue9jccwjd3l",
          "publisher_image_url":
              "https://image.luminews.my/ka0k8qfpbza9l2b1zr6pnveed7qe",
          "publisher_rectangle_url":
              "https://image.luminews.my/lemd96w8l5h435lg4e9z4ecndeda",
          "updated": "1 hour ago",
          "link":
              "https://says.com/my/news/consumers-association-please-don-t-buy-rabbits-as-pets-just-for-cny-this-year"
        },
        {
          "news_title": "Orang Asli frightened by bear",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/x6hawq4hw7dsyyu5pjw2fcdxitd8",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "1 hour ago",
          "link":
              "https://www.nst.com.my/news/nation/2023/01/868554/orang-asli-frightened-bear"
        },
        {
          "news_title": "Man claims bear dug up and ate wife's corpse",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/btvzmeolclopz06pagn5fk756am6",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "1 hour ago",
          "link":
              "https://www.nst.com.my/news/nation/2023/01/868554/man-claims-bear-dug-and-ate-wifes-corpse"
        },
        {
          "news_title":
              "No-show at Australian Open fuels fears for Osaka’s future",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/6uxndijbjhuynhqr531jo8o8azdn",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "1 hour ago",
          "link":
              "https://www.freemalaysiatoday.com/category/sports/2023/01/09/australian-open-no-show-fuels-fears-for-osakas-tennis-future/"
        },
        {
          "news_title":
              "Focus on Istana Seri Kinabalu, Sri Gaya on Sabah's political turmoil",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/t8tazrcwe8bmzim4e8ks1aoa0pjt",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "2 hours ago",
          "link":
              "https://www.nst.com.my/news/nation/2023/01/868552/focus-istana-seri-kinabalu-sri-gaya-sabahs-political-turmoil"
        },
        {
          "news_title":
              "Prasarana allocated RM2.8 billion to improve train, bus services",
          "publisher_name": "Sinar Daily",
          "image_url": "https://image.luminews.my/jam5gtnynq4k4ml6embfkfaenjae",
          "publisher_image_url":
              "https://image.luminews.my/4pzezu81wj0vw6wudfwelgkjdtzu",
          "publisher_rectangle_url":
              "https://image.luminews.my/x3ftcyp5wazqvgxg615x64rpfxyl",
          "updated": "2 hours ago",
          "link":
              "https://www.sinardaily.my/article/187945/malaysia/national/prasarana-allocated-rm28-billion-to-improve-train-bus-services"
        },
        {
          "news_title":
              "Doctor Drives Car Into Opposite Lane And Causes Accident That Kills Mum & Son",
          "publisher_name": "SAYS",
          "image_url": "https://image.luminews.my/npkotknne2uc7bc8f8fr6s18i55v",
          "publisher_image_url":
              "https://image.luminews.my/ka0k8qfpbza9l2b1zr6pnveed7qe",
          "publisher_rectangle_url":
              "https://image.luminews.my/lemd96w8l5h435lg4e9z4ecndeda",
          "updated": "2 hours ago",
          "link":
              "https://says.com/my/news/doctor-drives-car-into-opposite-lane-and-causes-accident-that-kills-mum-son"
        },
        {
          "news_title":
              "BIZ in BRIEF: Wellspire, CSH Alliance, Pan Malaysia and Classita",
          "publisher_name": "The Malaysian Reserve",
          "image_url": "https://image.luminews.my/mpwqrzwxt6vnrzhuqhq1zd8y94bj",
          "publisher_image_url":
              "https://image.luminews.my/r0umhz9dkk0q9nrcp5izrarl08k9",
          "publisher_rectangle_url":
              "https://image.luminews.my/nv3vj8tzhixqzakuxyz9z1tw3o4z",
          "updated": "2 hours ago",
          "link":
              "https://themalaysianreserve.com/2023/01/09/biz-in-brief-wellspire-csh-alliance-pan-malaysia-and-classita/"
        },
        {
          "news_title": "#TECH: Time spent online sees biggest dip in a decade",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/r3v38e7w3ia92xfiaqw0i3tmow4c",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "2 hours ago",
          "link":
              "https://www.nst.com.my/lifestyle/bots/2023/01/868550/tech-time-spent-online-sees-biggest-dip-decade"
        },
        {
          "news_title":
              "Suzuki expects rocky road to sub-US\$15,000 electric minicar",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/ztvzkgio3uv9nfpt0d49m42ud2st",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "2 hours ago",
          "link":
              "https://www.freemalaysiatoday.com/category/business/2023/01/09/suzuki-expects-rocky-road-to-sub-us15000-electric-minicar/"
        },
        {
          "news_title":
              "Travelling To Thailand? Here Are New COVID-19 Measures All M'sians Need To Know From 9 Jan",
          "publisher_name": "SAYS",
          "image_url": "https://image.luminews.my/6ly7do5wgieq4uctfevhcd1yyo1b",
          "publisher_image_url":
              "https://image.luminews.my/ka0k8qfpbza9l2b1zr6pnveed7qe",
          "publisher_rectangle_url":
              "https://image.luminews.my/lemd96w8l5h435lg4e9z4ecndeda",
          "updated": "2 hours ago",
          "link":
              "https://says.com/my/news/thailand-new-covid19-measures-all-malaysians-need-to-know-9jan"
        },
        {
          "news_title":
              "This Residence Is Located On The Highest Point Of Bukit Jalil & Boasts Over 90 Facilities",
          "publisher_name": "SAYS",
          "image_url": "https://image.luminews.my/yfwwy54t2sg41pfhkx9njzpp7uwm",
          "publisher_image_url":
              "https://image.luminews.my/ka0k8qfpbza9l2b1zr6pnveed7qe",
          "publisher_rectangle_url":
              "https://image.luminews.my/lemd96w8l5h435lg4e9z4ecndeda",
          "updated": "2 hours ago",
          "link":
              "https://says.com/my/lifestyle/lbs-bina-residensi-bintang-bukit-jalil"
        },
        {
          "news_title":
              "Underwood Bakers Restaurant rocks up with a refreshed setting & revamped menu in Bukit Bintang",
          "publisher_name": "Eat Drink KL",
          "image_url": "https://image.luminews.my/ijqe38rmzxwu7hfjrvc9m7yqfnp4",
          "publisher_image_url":
              "https://image.luminews.my/kif1hbb2xieez17k64uvu8wsml8m",
          "publisher_rectangle_url":
              "https://image.luminews.my/ogx1rusm12akyf0rwwnok729rmvc",
          "updated": "2 hours ago",
          "link":
              "https://www.eatdrinkkl.com/posts/featured/underwood-bakers-restaurant-rocks-up-with-a-refreshed-setting-revamped-menu-in-bukit-bintang"
        },
        {
          "news_title": "Kedah encourages F&B operators to mask up",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/5z1wxunc77yeff9ab147ttmttfsr",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "2 hours ago",
          "link":
              "https://www.nst.com.my/news/nation/2023/01/868548/kedah-encourages-fb-operators-mask"
        },
        {
          "news_title": "Short-term rates to remain stable on BNM’s operations",
          "publisher_name": "The Malaysian Reserve",
          "image_url": "https://image.luminews.my/9h7mgud7xqfbw44upeilqg7tpsxa",
          "publisher_image_url":
              "https://image.luminews.my/r0umhz9dkk0q9nrcp5izrarl08k9",
          "publisher_rectangle_url":
              "https://image.luminews.my/nv3vj8tzhixqzakuxyz9z1tw3o4z",
          "updated": "2 hours ago",
          "link":
              "https://themalaysianreserve.com/2023/01/09/short-term-rates-to-remain-stable-on-bnms-operations-2/"
        },
        {
          "news_title": "Kvitova takes her chances, downs Rybakina in Adelaide",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/ldc84ugiyurnmenczgtrhmdam275",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "2 hours ago",
          "link":
              "https://www.freemalaysiatoday.com/category/sports/2023/01/09/kvitova-takes-her-chances-downs-rybakina-in-adelaide/"
        },
        {
          "news_title":
              "KTMB To Provide Additional ETS Rides For Chinese New Year 2023",
          "publisher_name": "SAYS",
          "image_url": "https://image.luminews.my/r72lnwgyirng6u10pb5xa5ov8m80",
          "publisher_image_url":
              "https://image.luminews.my/ka0k8qfpbza9l2b1zr6pnveed7qe",
          "publisher_rectangle_url":
              "https://image.luminews.my/lemd96w8l5h435lg4e9z4ecndeda",
          "updated": "2 hours ago",
          "link":
              "https://says.com/my/news/additional-ets-rides-for-chinese-new-year-2023"
        },
        {
          "news_title":
              "China likely to reject ‘outsider’ vaccines, says SK Bioscience",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/7mj37ykli7qauidittmqvmy8rz2o",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "2 hours ago",
          "link":
              "https://www.freemalaysiatoday.com/category/world/2023/01/09/china-likely-to-reject-outsider-vaccines-says-sk-bioscience/"
        },
        {
          "news_title":
              "OnePlus may release its first tablet, codenamed ‘Aries’ alongside the OnePlus 11R",
          "publisher_name": "TechNave",
          "image_url": "https://image.luminews.my/1c0lljw35ebbw71adupsuly6ch7i",
          "publisher_image_url":
              "https://image.luminews.my/21eaac4t1vf2iesdatu940xcvb6y",
          "publisher_rectangle_url":
              "https://image.luminews.my/ro6edlgelkrtz2r5go7ssts7nufz",
          "updated": "2 hours ago",
          "link":
              "https://technave.com/gadget/OnePlus-may-release-its-first-tablet-codenamed-Aries-alongside-the-OnePlus-11R-33046.html"
        },
        {
          "news_title":
              "A man got scammed out of RM23K for trying to buy a fake Touch 'n Go family package plan online",
          "publisher_name": "TechNave",
          "image_url": "https://image.luminews.my/fhs309nl0g9n8u1rckswbdexzdve",
          "publisher_image_url":
              "https://image.luminews.my/21eaac4t1vf2iesdatu940xcvb6y",
          "publisher_rectangle_url":
              "https://image.luminews.my/ro6edlgelkrtz2r5go7ssts7nufz",
          "updated": "2 hours ago",
          "link":
              "https://technave.com/gadget/A-man-got-scammed-out-of-RM23K-for-trying-to-buy-a-fake-Touch-n-Go-family-package-plan-online-33045.html"
        },
        {
          "news_title": "Australian PM pledges aid for flood-ravaged northwest",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/ik1iugziep48jx1bljrfpnavltep",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "2 hours ago",
          "link":
              "https://www.freemalaysiatoday.com/category/world/2023/01/09/australia-pledges-aid-for-flood-ravaged-northwest/"
        },
        {
          "news_title":
              "Pharmaniaga expands distribution capacity in northern region",
          "publisher_name": "The Malaysian Reserve",
          "image_url": "https://image.luminews.my/eswn1rrl8gneb2t13j4tulbyspux",
          "publisher_image_url":
              "https://image.luminews.my/r0umhz9dkk0q9nrcp5izrarl08k9",
          "publisher_rectangle_url":
              "https://image.luminews.my/nv3vj8tzhixqzakuxyz9z1tw3o4z",
          "updated": "2 hours ago",
          "link":
              "https://themalaysianreserve.com/2023/01/09/pharmaniaga-expands-distribution-capacity-in-northern-region/"
        },
        {
          "news_title":
              "I Thought It Was Beef\" — Man Finds Dirty Washcloth In His Hot Pot Takeaway Order",
          "publisher_name": "SAYS",
          "image_url": "https://image.luminews.my/914xk0tdfloqpkbpd6xle30x1e62",
          "publisher_image_url":
              "https://image.luminews.my/ka0k8qfpbza9l2b1zr6pnveed7qe",
          "publisher_rectangle_url":
              "https://image.luminews.my/lemd96w8l5h435lg4e9z4ecndeda",
          "updated": "2 hours ago",
          "link":
              "https://says.com/my/news/man-finds-dirty-washcloth-hotpot-takeaway-order"
        },
        {
          "news_title":
              "[LIVE] Prime Minister Datuk Seri Anwar Ibrahim at Istana Bogor",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/nwv0vx1piyiuvio9xd149jj1l44b",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "2 hours ago",
          "link":
              "https://www.nst.com.my/news/nation/2023/01/868545/live-prime-minister-datuk-seri-anwar-ibrahim-istana-bogor"
        },
        {
          "news_title":
              "Thailand starts screening arrivals for proof of Covid vaccinations as it braces for influx of Chinese tourists",
          "publisher_name": "South China Morning Post",
          "image_url": "https://image.luminews.my/gy2h3geugnvq87a65n6bvitonl57",
          "publisher_image_url":
              "https://image.luminews.my/c1tb5x8fn5j5brchdqsuv6j5x6ta",
          "publisher_rectangle_url":
              "https://image.luminews.my/acu9yvbwmw6sfidwnyokt3n5t5rl",
          "updated": "2 hours ago",
          "link":
              "https://www.scmp.com/news/asia/southeast-asia/article/3206053/thailand-starts-screening-arrivals-proof-covid-vaccinations-it-braces-influx-chinese-tourists?utm_source=rss_feed"
        },
        {
          "news_title":
              "#Showbiz: Taylor Swift's cat Olivia Benson is world's third richest pet",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/o1fko418t0hgs7h94c1c328rixv2",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "2 hours ago",
          "link":
              "https://www.nst.com.my/lifestyle/groove/2023/01/868543/showbiz-taylor-swifts-cat-olivia-benson-worlds-third-richest-pet"
        },
        {
          "news_title":
              "Not sacking Tian Chua would have sent wrong signal, says analyst",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/v7b89nmzthjrkta909j5hrd86mak",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "2 hours ago",
          "link":
              "https://www.freemalaysiatoday.com/category/nation/2023/01/09/not-sacking-tian-chua-would-have-sent-wrong-signal-say-analysts/"
        },
        {
          "news_title":
              "3 ways to travel in luxurious style in 2023: from VistaJet’s Michelin-starred dining on your private jet, to Lamborghini’s all-terrain super sports car Huracán Sterrato and the electric Rimac Nevera",
          "publisher_name": "South China Morning Post",
          "image_url": "https://image.luminews.my/cylp8i5rkdzkoplwz15jmcyygv8g",
          "publisher_image_url":
              "https://image.luminews.my/c1tb5x8fn5j5brchdqsuv6j5x6ta",
          "publisher_rectangle_url":
              "https://image.luminews.my/acu9yvbwmw6sfidwnyokt3n5t5rl",
          "updated": "2 hours ago",
          "link":
              "https://www.scmp.com/magazines/style/luxury/article/3205870/3-ways-travel-luxurious-style-2023-vistajets-michelin-starred-dining-your-private-jet-lamborghinis?utm_source=rss_feed"
        },
        {
          "news_title":
              "Many bosses not abiding by Employment Act changes, says MTUC",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/30mf5zb3v0rkhofa7290ewp50l1u",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "2 hours ago",
          "link":
              "https://www.freemalaysiatoday.com/category/nation/2023/01/09/many-bosses-not-abiding-by-employment-act-changes-says-mtuc/"
        },
        {
          "news_title": "Not meant for specific groups'",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/53rlin7aaniiz2546i6lqsrou0k2",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "2 hours ago",
          "link":
              "https://www.nst.com.my/business/2023/01/868541/not-meant-specific-groups"
        },
        {
          "news_title":
              "Foreign investors kick off 2023 with net purchases of RM72.3mil on Bursa",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/mkh7lrdoqcn9cxvlax7aowhs4je1",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "2 hours ago",
          "link":
              "https://www.freemalaysiatoday.com/category/business/2023/01/09/foreign-investors-kick-off-2023-with-net-purchases-of-rm72-3mil-on-bursa/"
        },
        {
          "news_title": "Revenue Group stock fell 31% in past week",
          "publisher_name": "The Malaysian Reserve",
          "image_url": "https://image.luminews.my/qmedkegpg9aqycelvj4ihbojyimr",
          "publisher_image_url":
              "https://image.luminews.my/r0umhz9dkk0q9nrcp5izrarl08k9",
          "publisher_rectangle_url":
              "https://image.luminews.my/nv3vj8tzhixqzakuxyz9z1tw3o4z",
          "updated": "2 hours ago",
          "link":
              "https://themalaysianreserve.com/2023/01/09/revenue-group-stock-fell-31-in-past-week/"
        },
        {
          "news_title": "There Are 5 Types of Travelers. Which One Are You?",
          "publisher_name": "Mashable Southeast Asia",
          "image_url": "https://image.luminews.my/bp2lrm6cl1ah8twe1cpc9w4fx0p8",
          "publisher_image_url":
              "https://image.luminews.my/plq0xzaw5hl1rcxy3kpkcbmuwg30",
          "publisher_rectangle_url":
              "https://image.luminews.my/5yb77nb9c8pgdi0hdoio2m5nm9np",
          "updated": "2 hours ago",
          "link":
              "https://sea.mashable.com/life/21859/there-are-5-types-of-travelers-which-one-are-you"
        },
        {
          "news_title":
              "Samsung maintains chip investment pace despite plunging profit",
          "publisher_name": "FMT News",
          "image_url": "https://image.luminews.my/evbiigifhsl6jr7jydsnmrrulwei",
          "publisher_image_url":
              "https://image.luminews.my/u2op38i1jt1zk587dounod4t9wda",
          "publisher_rectangle_url":
              "https://image.luminews.my/2esdwcm6yzvqodrbz01x6tflkxlm",
          "updated": "2 hours ago",
          "link":
              "https://www.freemalaysiatoday.com/category/business/2023/01/09/samsung-maintains-chip-investment-pace-despite-plunging-profit/"
        },
        {
          "news_title":
              "Sabah’s political situation: Focus continues at Istana Seri Kinabalu, Sri Gaya",
          "publisher_name": "The Borneo Post",
          "image_url": "https://image.luminews.my/4f19u2jfsuk4zsuc2elwz8zmnen4",
          "publisher_image_url":
              "https://image.luminews.my/ko52gau8d5hsnipyc1g9tu8ibox4",
          "publisher_rectangle_url":
              "https://image.luminews.my/dj1u667yq78wjhqr5mgu8vja7dbw",
          "updated": "2 hours ago",
          "link":
              "https://www.theborneopost.com/2023/01/09/sabahs-political-situation-focus-continues-at-istana-seri-kinabalu-sri-gaya/"
        },
        {
          "news_title":
              "BURO TV Guide January 2023: ‘Kaleidoscope’, ‘Shrinking’, and more",
          "publisher_name": "BURO Malaysia",
          "image_url": "https://image.luminews.my/2y9rf02q4gjpe0xdt0hqvus4o4ow",
          "publisher_image_url":
              "https://image.luminews.my/qqum61bes9uxfbsa3kee91h5i091",
          "publisher_rectangle_url":
              "https://image.luminews.my/6jgas0y6uqg7emmk36tgj5dt20rt",
          "updated": "2 hours ago",
          "link":
              "https://www.buro247.my/culture/film-tv-and-theatre/netflix-apple-tv-show-january-2023.html"
        },
        {
          "news_title":
              "#TECH: From tracking moods to putting on a show, it's AI-everything at CES",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/ged8uau5ki5vir9w4kur3gwym6tx",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "2 hours ago",
          "link":
              "https://www.nst.com.my/lifestyle/bots/2023/01/868539/tech-tracking-moods-putting-show-its-ai-everything-ces"
        },
        {
          "news_title": "Langkawi-Koh Lanta ferry service to start soon",
          "publisher_name": "New Straits Times",
          "image_url": "https://image.luminews.my/5fq3kh95malnz3g6kc0b41dbqbq2",
          "publisher_image_url":
              "https://image.luminews.my/2bdlab3q4ztmhga0m31k4he0xns0",
          "publisher_rectangle_url":
              "https://image.luminews.my/uoq67kxxmbyd9s4o3a0hjajyjgqc",
          "updated": "2 hours ago",
          "link":
              "https://www.nst.com.my/news/nation/2023/01/868537/langkawi-koh-lanta-ferry-service-start-soon"
        }
      ], requestOptions: options);
      handler.resolve(mockResponse);
    } else {
      super.onRequest(options, handler);
    }
  }
}