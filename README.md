# Conversation History




## **Enhancements If No Time Constraints**

### **1️⃣ Full-Text Search for Comments**
- Add `pg_search` gem
- Implement search on `content` field

### **2️⃣ Caching Recent Comments**
- Use Rails cache to store and quickly retrieve latest comments

### **3️⃣ WebSockets for Real-Time Updates**
- Use ActionCable to push new comments to all users

### **4️⃣ UI Enhancements**
- Show replies in a threaded manner
- Allow tagging other users in comments (`@mentions`)

### **5️⃣ Notifications**
- Send email or in-app notifications for replies and mentions

---