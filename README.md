# Conversation History


# Project Conversation History Feature Clarification

### Questions to Colleagues & Expected Answers

1. **What are the possible statuses for a project?**  
   *Expected Answer:*  
   Predefined list:git remote add origin git@github.com:jetanuwoma/project_history.git `Pending`, `In Progress`, `Completed`, `Archived`.

2. **Can all users perform both actions (comment & status change)?**  
   *Expected Answer:*  
   Yes, any authenticated user can comment or change the status.

3. **How should the conversation history be ordered?**  
   *Expected Answer:*  
   Chronologically, oldest first, with new entries added to the bottom.

4. **Are notifications required for status changes or comments?**  
   *Expected Answer:*  
   No notifications needed for this initial version.

5. **Can users edit or delete history entries?**  
   *Expected Answer:*  
   No, the history is immutable once created.

6. **What UI components are needed for input forms?**  
   *Expected Answer:*
    - Simple text area for comments
    - Dropdown selector for status changes
    - Both forms should live on the project page

7. **Is there any access control beyond basic authentication?**  
   *Expected Answer:*  
   No special permissions – all authenticated users have equal access.

8. **Should the current status be displayed prominently?**  
   *Expected Answer:*  
   Yes, show it as a badge near the project title.

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