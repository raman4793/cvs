SuperAdmin.create!([
                       {email: "sadmin@cvs.com", encrypted_password: "$2a$11$eZYpX5oJ9GE755SrqTHxPex6/0IzTVX3Du7SVhR2Qll4S7gVVrJLG", img: "avatar5.png", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 13, current_sign_in_at: "2017-08-14 12:17:04", last_sign_in_at: "2017-08-14 02:58:33", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "Super Admin"}
                   ])

Plan.create!([
                 {name: "Platinum", amount: 500.0, period: 6, number_of_lines: 8000, number_of_files: 8, size_of_files: 800, number_of_users: 10},
                 {name: "Silver", amount: 100.0, period: 6, number_of_lines: 20, number_of_files: 2, size_of_files: 200, number_of_users: 1},
                 {name: "Gold", amount: 200.0, period: 6, number_of_lines: 4000, number_of_files: 3, size_of_files: 400, number_of_users: 5}
             ])
Type.create!([
                 {name: "Medical"},
                 {name: "Legal"},
                 {name: "General"}
             ])


Admin.create!([
  {name: nil, uname: nil, email: "admin0@cvs.com", encrypted_password: "$2a$11$.DD9SKyJ4rtPdgzNmJf85uOoNqiPwczUrUa.mliZ4Lf7BCelwKLrq", img: "avatar2.png", is_active: true, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil},
  {name: nil, uname: nil, email: "admin2@cvs.com", encrypted_password: "$2a$11$jwfXpy8li..mFWNvK/mGHuwJIHiMF3OxLWkGCMJdA7HThqaBNsOIS", img: "avatar2.png", is_active: true, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil},
  {name: nil, uname: nil, email: "admin3@cvs.com", encrypted_password: "$2a$11$NtP0olMvOq79zdnEz6/tieaXRhPcv//gVr0J0eJr29NMx0lp1tRNe", img: "avatar5.png", is_active: true, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil},
  {name: nil, uname: nil, email: "admin4@cvs.com", encrypted_password: "$2a$11$N4LQeJmkyWvJW6jUA8UMVu2LVMUTkJwcdLMAMJb1NR6pJdlqOC4C.", img: "avatar5.png", is_active: true, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil},
  {name: nil, uname: nil, email: "admin5@cvs.com", encrypted_password: "$2a$11$TaK.Jx6tuM4fVEBhTpWtk.v.iNtuHAf.h0Vv2LF2giZm5JzSQPop.", img: "avatar4.png", is_active: true, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil},
  {name: nil, uname: nil, email: "admin6@cvs.com", encrypted_password: "$2a$11$FGMJM3wk6/hDKe5ESfiIZOqpzvXYCftS7ajLvZEqCQ0Uh67v1mtb2", img: "avatar2.png", is_active: true, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil},
  {name: nil, uname: nil, email: "admin7@cvs.com", encrypted_password: "$2a$11$3N.GDBBospDXb4LsvC8VBO0d7t0ytX86kwheNin7gxReGymS6LyRq", img: "avatar2.png", is_active: true, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil},
  {name: nil, uname: nil, email: "admin1@cvs.com", encrypted_password: "$2a$11$Ih3aF5LMpAQmfdTgNbssBOi7mN6OuQ.MfoAA4C9QNnJS9dkFGYxAm", img: "avatar3.png", is_active: true, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2017-08-03 11:15:17", last_sign_in_at: "2017-07-31 15:33:46", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil},
  {name: nil, uname: nil, email: "testuser@cvs.com", encrypted_password: "$2a$11$ndMmtifC2ki/AQRVAfDr2eBdY.GQFd1.K63yEIZpmbcTATzwEynLq", img: nil, is_active: true, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-08-03 14:51:11", last_sign_in_at: "2017-08-03 14:51:11", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil},
  {name: nil, uname: nil, email: "test12@gmail.com", encrypted_password: "$2a$11$wh4uHED0k8YAIWNAqKNzP.77wAzfMCgGUwreCk94tTT0DqZRusmQm", img: nil, is_active: true, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil},
  {name: "UKE Admin", uname: nil, email: "uke@cvs.com", encrypted_password: "$2a$11$X0yPwmREigvNqjpnSiNA3e8B.SyTUV0DLaZPqoUQalZV6nvnqKK.O", img: nil, is_active: true, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2017-08-03 14:16:49", last_sign_in_at: "2017-08-03 14:15:29", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil},
  {name: "SUT Admin", uname: nil, email: "sut@cvs.com", encrypted_password: "$2a$11$4T8x8prNIdE33ydou8UGL.ocLCT6/9aCjuGbYHma3xEYdCqF6YxZ6", img: nil, is_active: true, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 7, current_sign_in_at: "2017-08-16 12:38:32", last_sign_in_at: "2017-08-15 11:34:49", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil}
])

Business.create!([
  {name: "Schumm-Tromp", approved: false, customer_token: nil, type_id: 2, admin_id: 4, plan_id: 3, key: nil},
  {name: "Hudson and Sons", approved: false, customer_token: nil, type_id: 1, admin_id: 5, plan_id: 3, key: nil},
  {name: "Mante-Lueilwitz", approved: false, customer_token: nil, type_id: 1, admin_id: 6, plan_id: 3, key: nil},
  {name: "Hansen, West and Reynolds", approved: false, customer_token: nil, type_id: 1, admin_id: 7, plan_id: 1, key: nil},
  {name: "Greenfelder-Hegmann", approved: false, customer_token: nil, type_id: 1, admin_id: 8, plan_id: 3, key: nil},
  {name: "Dibbert-Berge", approved: true, customer_token: nil, type_id: 2, admin_id: 2, plan_id: 1, key: nil},
  {name: "UKE", approved: true, customer_token: "cus_B926nx3HNciMHW", type_id: 3, admin_id: 10, plan_id: 3, key: nil},
  {name: "Test", approved: true, customer_token: nil, type_id: 1, admin_id: 11, plan_id: 2, key: nil},
  {name: "Test", approved: false, customer_token: nil, type_id: 1, admin_id: 12, plan_id: 1, key: nil},
  {name: "Bernhard and Sons", approved: true, customer_token: nil, type_id: 3, admin_id: 1, plan_id: 2, key: nil},
  {name: "Thiel-Klein", approved: true, customer_token: nil, type_id: 3, admin_id: 3, plan_id: 3, key: nil},
  {name: "SUT", approved: true, customer_token: "cus_B91YtBi5KUZ9NV", type_id: 2, admin_id: 9, plan_id: 2, key: "AX\x1C+\xA6\x93\xC7\xDD@\x96\xDB\x9D\xC0\x98\xE7\xA9\xF9/\xD2r\xEB\xA1\x13P\xE0\x89\x16^\x95\xE1\xF5\xF8"}
])
Transcriber.create!([
                        {email: "transcriber@cvs.com", encrypted_password: "$2a$11$Ga/CHUWPpTRJ.yG9PGIv0OG.xuPefXmvJ4CPrTm0raEP49zhii1aW", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 5, current_sign_in_at: "2017-08-14 14:04:34", last_sign_in_at: "2017-08-14 12:49:47", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "test", business_id: 9, img: nil}
                    ])
User.create!([
                 {name: nil, uname: nil, encrypted_key: nil, email: "user.schumm-tromp@cvs.com", encrypted_password: "$2a$11$uyNq4s2uSOZhf3Z/SDZ.aetCzXQLpaU.xpG0a45835YLEI6Wq/KZu", reset_password_token: nil, reset_password_sent_at: nil, is_active: true, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, business_id: 4},
                 {name: nil, uname: nil, encrypted_key: nil, email: "user.mante-lueilwitz@cvs.com", encrypted_password: "$2a$11$OfVMo7olIfeYOVM4voCMheBTL4GZ7GwBBCHEWLwlGNs0wUHnIZh0G", reset_password_token: nil, reset_password_sent_at: nil, is_active: true, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, business_id: 6},
                 {name: nil, uname: nil, encrypted_key: nil, email: "user.greenfelder-hegmann@cvs.com", encrypted_password: "$2a$11$lSHgi9H44qiOsd/onIDX.uPBATa.gBKh/PQA2EU9NWjxumyY634sO", reset_password_token: nil, reset_password_sent_at: nil, is_active: true, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, business_id: 8},
                 {name: "Test", uname: "test", encrypted_key: nil, email: "test@cvs.com", encrypted_password: "$2a$11$Ej1SZN3vyiFeWLvRkdH26.4juvlYQzPmI8NT6inkhYqy/bgcuR0Ry", reset_password_token: nil, reset_password_sent_at: nil, is_active: true, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, business_id: 2},
                 {name: "UKE Employee1", uname: "uke1", encrypted_key: nil, email: "ukeuser1@cvs.com", encrypted_password: "$2a$11$o5zpAjTGSSqOKyvDEk3r3OkU0qtzUq4lG0IHWgg74emzuy.H.jAQG", reset_password_token: nil, reset_password_sent_at: nil, is_active: true, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-08-03 14:18:56", last_sign_in_at: "2017-08-03 14:18:56", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", business_id: 10},
                 {name: "User1", uname: "u1", encrypted_key: nil, email: "usertest@cvs.com", encrypted_password: "$2a$11$bwlpVEzXBCfOGaDM6x/Dvu1YfwcesJBKtrHjPFh8AX8ZfPJnXQFEq", reset_password_token: nil, reset_password_sent_at: nil, is_active: true, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-08-03 15:02:14", last_sign_in_at: "2017-08-03 15:02:14", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", business_id: 11},
                 {name: nil, uname: nil, encrypted_key: nil, email: "user.thiel-klein@cvs.com", encrypted_password: "$2a$11$6N8W/86pEcOqYyBa0Jcm4eJ4Ecc45sN33kArM04KnHoBmpSMl.p46", reset_password_token: nil, reset_password_sent_at: nil, is_active: true, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2017-08-11 10:12:43", last_sign_in_at: "2017-08-11 10:10:53", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", business_id: 3},
                 {name: "John", uname: nil, encrypted_key: nil, email: "user.dibbert-berge@cvs.com", encrypted_password: "$2a$11$GOnJ3Vl2QyoPpWigiIS4p.aeoQRaKbsQF4vj7lkG5ojBPGNC8QB66", reset_password_token: nil, reset_password_sent_at: nil, is_active: true, remember_created_at: nil, sign_in_count: 6, current_sign_in_at: "2017-08-14 16:00:27", last_sign_in_at: "2017-08-11 05:25:18", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", business_id: 9}
             ])

Upload.create!([
                   {file_name: "07-29-2017_00-05_msg555236.wav", user_id: 1},
                   {file_name: "07-29-2017_00-05_msg555236.wav", user_id: 7},
                   {file_name: "woman1_wb.wav", user_id: 1},
                   {file_name: "woman1_wb.wav", user_id: 1},
                   {file_name: "woman1_wb.wav", user_id: 1}
               ])

Conversation.create!([
  {sendable_id: 1, sendable_type: "SuperAdmin", recipientable_id: 9, recipientable_type: "Admin"},
  {sendable_id: 1, sendable_type: "SuperAdmin", recipientable_id: 10, recipientable_type: "Admin"},
  {sendable_id: 9, sendable_type: "Admin", recipientable_id: 1, recipientable_type: "User"}
])

Job.create!([
  {upload_id: 1, status: "Finished", draft: "this is a test recording for cloud vs", file_name: nil, user_id: 1, nol: 1, file_size: 1129038},
  {upload_id: 4, status: "In Queue", draft: "to administer medicine to animals is freaking give very difficult matter and yet sometimes it necessary to do self.", file_name: nil, user_id: 1, nol: nil, file_size: 225324},
  {upload_id: 5, status: "Finished", draft: "to administer medicine to animals is freaking give very difficult matter and yet sometimes it necessary to do self.\r\n", file_name: "job_4.txt", user_id: 1, nol: 1, file_size: 225452}
])
Message.create!([
  {sendable_id: 1, sendable_type: "SuperAdmin", content: "Hello", conversation_id: 5},
  {sendable_id: 1, sendable_type: "SuperAdmin", content: "Hai", conversation_id: 6},
  {sendable_id: 9, sendable_type: "Admin", content: "How are you doing", conversation_id: 5},
  {sendable_id: 10, sendable_type: "Admin", content: "Good day to you", conversation_id: 6},
  {sendable_id: 1, sendable_type: "SuperAdmin", content: "hai", conversation_id: 5},
  {sendable_id: 1, sendable_type: "SuperAdmin", content: "Is the site services to your satisfaction", conversation_id: 5},
  {sendable_id: 1, sendable_type: "SuperAdmin", content: "How would you rate our site", conversation_id: 6},
  {sendable_id: 9, sendable_type: "Admin", content: "Definitely...has been a wonderful experience so far", conversation_id: 5}
])


Event.create!([
                  {message: "created business", eventable_id: 9, eventable_type: "Business", initiatable_id: 9, initiatable_type: "Admin"},
                  {message: "submitted job", eventable_id: 1, eventable_type: "Job", initiatable_id: 1, initiatable_type: "User"},
                  {message: "submitted job", eventable_id: 2, eventable_type: "Job", initiatable_id: 1, initiatable_type: "User"},
                  {message: "finished job", eventable_id: 1, eventable_type: "Job", initiatable_id: 1, initiatable_type: "Transcriber"},
                  {message: "created user", eventable_id: 1, eventable_type: "User", initiatable_id: 9, initiatable_type: "Admin"}
              ])