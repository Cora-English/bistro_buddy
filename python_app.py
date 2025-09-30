import tkinter as tk
import mysql.connector
from tkinter import messagebox
from tkcalendar import Calendar

# --- DATABASE CONNECTION SETUP ---
try:
    conn = mysql.connector.connect(
        host="localhost",         # or IP address (e.g., "127.0.0.1")
        user="root",     # e.g., "root"
        password="Daffodil25!", # your MySQL password
        database="bistrobuddy"  # e.g., "bistro_buddy"
    )
    cursor = conn.cursor()
except mysql.connector.Error as err:
    messagebox.showerror("Database Error", f"Error connecting to database: {err}")
    exit()

root = tk.Tk()
root.title("Bistro Buddy")
# --- GUI SETUP ---
def proceed_to_name():
    global selected_date
    selected_date = calendar.get_date()
    calendar_frame.pack_forget()
    name_frame.pack(pady=20)
                    
def greet_and_save():
    guest_first_name = first_name_entry.get()
    guest_last_name = last_name_entry.get()

    if guest_first_name.strip() == "":
        label.config(text="Please enter your first name.")
        return
    if guest_last_name.strip() == "":
        label.config(text="Please enter your last name.")
        return

    try:
        cursor.execute("INSERT INTO tblguest (Guest_firstname, Guest_lastname) VALUES (%s, %s)", (guest_first_name, guest_last_name))
        cursor.execute("INSERT INTO tblreservations (date) VALUES(%s)", (selected_date,))                                                                                   )
        conn.commit()
        label.config(text=f"Hello, {guest_first_name}! Your name has been saved.")
    except mysql.connector.Error as err:
        messagebox.showerror("Database Error", f"Failed to insert data: {err}")

calendar_frame = tk.Frame(root)
tk.Label(calendar_frame, text="Select your reservation date:").pack(pady=5)

calendar = Calendar(calendar_frame, selectmode="day", date_pattern="yyyy-mm-dd")
calendar.pack(pady=5)

tk.Button(calendar_frame, text="Next", command=proceed_to_name).pack(pady=10)
calendar_frame.pack(pady=20)



tk.Label(root, text="Enter your first name:").pack(pady=5)
first_name_entry = tk.Entry(root)
first_name_entry.pack(pady=5)

tk.Label(root, text="Enter your last name:").pack(pady=5)
last_name_entry = tk.Entry(root)
last_name_entry.pack(pady=5)

tk.Button(root, text="Greet & Save", command=greet_and_save).pack(pady=5)
label = tk.Label(root, text="")
label.pack(pady=5)

root.mainloop()

# Optional: Close the connection when done
cursor.close()
conn.close()
