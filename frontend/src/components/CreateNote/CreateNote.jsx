import { useState } from "react";
import { RiAddCircleLine as Add } from "react-icons/ri";
import APIService from "../../services/APIService";
import notifySuccess, {
  notifyError,
} from "../../services/ToastNotificationService";
import s from "./CreateNote.module.css";

export default function CreateNote() {
  const [note, setNote] = useState({
    title: "",
    content: "",
    user_id: null,
    color_id: null,
    types_id: null,
    category_id: null,
  });
  const [isDeployed, setIsDeployed] = useState(false);
  const resetForm = () => {
    setNote({
      title: "",
      content: "",
      user_id: null,
      color_id: null,
      types_id: null,
      category_id: null,
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const res = await APIService.post(`notes`, note);
      if (res) {
        notifySuccess("Votre note a été créee");
        setIsDeployed(false);
        resetForm();
      } else throw new Error();
    } catch (err) {
      notifyError("La note n'a pas pu être ajoutée");
    }
  };

  const handleExpanded = () => {
    setIsDeployed(true);
  };

  const handleChange = async (e) => {
    setNote({
      ...note,
      [e.target.name]: e.target.value,
    });
  };

  return (
    <form action="addNote" onSubmit={handleSubmit} className={s.form}>
      {isDeployed && (
        <input
          type="text"
          placeholder="Titre"
          name="title"
          className={s.input}
          value={note.title}
          onChange={handleChange}
          required="required"
          id="title"
        />
      )}
      <textarea
        type="text"
        placeholder="Créer une note..."
        name="content"
        className={s.textarea}
        value={note.content}
        onClick={handleExpanded}
        onChange={handleChange}
        rows={isDeployed ? 3 : 1}
        required="required"
        id="content"
      />

      <button type="submit">
        <Add className={s.button} />
      </button>
    </form>
  );
}