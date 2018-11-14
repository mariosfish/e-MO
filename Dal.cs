using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using Web_Misthodosia_Opliton;

namespace Web_Misthodosia_Opliton
{
    public class Dal
    {
        SqlConnection conn = new SqlConnection(@"Data Source=DEUSEXMACHINA\SQLEXPRESS;Initial Catalog=Misthodosia_Opliton;Integrated Security=True");

        public Dal()
        {
            conn.Open();
        }
        public void insertOplitis(Oplitis myOplitis)
        {
            SqlCommand cmd = new SqlCommand("add_oplitis", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@asm", myOplitis.asm);
            cmd.Parameters.AddWithValue("@onoma", myOplitis.onoma);
            cmd.Parameters.AddWithValue("@eponymo", myOplitis.eponymo);
            cmd.Parameters.AddWithValue("@loxos", myOplitis.loxos);
            cmd.Parameters.AddWithValue("@eggrafi", myOplitis.eggrafi);
            cmd.Parameters.AddWithValue("@paratiriseis", myOplitis.paratiriseis);
            cmd.Parameters.AddWithValue("@bathmos", myOplitis.bathmos);
            cmd.Parameters.AddWithValue("@lastPayDay", myOplitis.lastPayDay);
            cmd.Parameters.AddWithValue("@katigoria", myOplitis.katigoria);
            cmd.Parameters.AddWithValue("@katigoriaFDM", myOplitis.katigoriaFDM);

            try
            {
                cmd.ExecuteNonQuery();
            }

            catch (Exception ex)
            {
                string exmsg = ex.Message.ToString();
            }

            finally
            {
                conn.Close();
            }
        }
        public void insertPliromi(Pliromi myPliromi)
        {
            SqlCommand cmd = new SqlCommand("add_pliromi", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@payDate", myPliromi.PayDay);
            cmd.Parameters.AddWithValue("@payType", myPliromi.pmid);
            cmd.Parameters.AddWithValue("@poso", myPliromi.Poso);
            cmd.Parameters.AddWithValue("@paid", myPliromi.Paid);
            cmd.Parameters.AddWithValue("@opid", myPliromi.Pliromi_opid);

            try
            {
                cmd.ExecuteNonQuery();
            }

            catch (Exception ex)
            {
                string exmsg = ex.Message.ToString();
            }

            finally
            {
                conn.Close();
            }
        }
        public void updateOplitis(Oplitis myOplitis)
        {
            SqlCommand cmd = new SqlCommand("update_oplitis", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", myOplitis.id);
            cmd.Parameters.AddWithValue("@asm", myOplitis.asm);
            cmd.Parameters.AddWithValue("@onoma", myOplitis.onoma);
            cmd.Parameters.AddWithValue("@eponymo", myOplitis.eponymo);
            cmd.Parameters.AddWithValue("@loxos", myOplitis.loxos);
            cmd.Parameters.AddWithValue("@metaboli", myOplitis.metaboli);
            cmd.Parameters.AddWithValue("@bathmos", myOplitis.bathmos);
            cmd.Parameters.AddWithValue("@katigoria", myOplitis.katigoria);
            cmd.Parameters.AddWithValue("@paratiriseis", myOplitis.paratiriseis);
            cmd.Parameters.AddWithValue("@isxysDate", myOplitis.isxysDate);
            try
            {
                cmd.ExecuteNonQuery();
            }

            catch (Exception ex)
            {
                string exmsg = ex.Message.ToString();
            }

            finally
            {
                conn.Close();
            }
        }
        public void deleteOplitis(Oplitis myOplitis)
        {
            SqlCommand cmd = new SqlCommand("delete_oplitis", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@opid", myOplitis.id);
            cmd.Parameters.AddWithValue("@dateDiagrafis", myOplitis.diagrafi);

            try
            {
                cmd.ExecuteNonQuery();
            }

            catch (Exception ex)
            {
                string error = ex.Message.ToString();
            }

        }
        public SqlDataReader getKatigoria()
        {
            SqlCommand cmd = new SqlCommand("get_katigoria", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader myDtr = null;
            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                string error = ex.Message.ToString();
            }

            return myDtr;
        }
        public SqlDataReader getDiagrammenosOplitis()
        {
            SqlCommand cmd = new SqlCommand("get_diagrammenos_oplitis", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader myDtr = null;
            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                string error = ex.Message.ToString();
            }

            return myDtr;
        }
        public SqlDataReader getXrimatikosLogismos()
        {
            SqlCommand cmd = new SqlCommand("get_xrimatikos_logismos", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader myDtr = null;
            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                string error = ex.Message.ToString();
            }

            return myDtr;
        }
        public SqlDataReader getPliromiDiagarammenouOplitiByIdOpliti(Oplitis myOplitis)
        {
            SqlCommand cmd = new SqlCommand("get_pliromi_diagrammenou_by_id_diagrammenou", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@doid", myOplitis.id);
            SqlDataReader myDtr = null;
            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                string error = ex.Message.ToString();
            }

            return myDtr;
        }
        public SqlDataReader getBiblioPliromon()
        {
            SqlCommand cmd = new SqlCommand("get_biblio_pliromon", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader myDtr = null;
            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                string error = ex.Message.ToString();
            }

            return myDtr;
        }
        public int LogIn(string username, string password)
        {
            SqlCommand cmd = new SqlCommand("login", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);
            int myDtr = 0;
            try
            {
                myDtr = (int)cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                string error = ex.Message.ToString();
            }
            return myDtr;
        }

        public int Register(User myUser)
        {
            SqlCommand cmd = new SqlCommand("register", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", myUser.username);
            cmd.Parameters.AddWithValue("@password", myUser.password);
            cmd.Parameters.AddWithValue("@bathmos", myUser.userRank);
            cmd.Parameters.AddWithValue("@onoma", myUser.userOnoma);
            cmd.Parameters.AddWithValue("@eponymo", myUser.userEponymo);
            cmd.Parameters.AddWithValue("@monada", myUser.userMonada);
            int value = 0;
            try
            {
                value = (int)cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                conn.Close();
            }
            return value;
        }
        public SqlDataReader getKatigoriaFromChange(Oplitis myOplitis)
        {
            SqlCommand cmd = new SqlCommand("get_katigoria_from_change", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@opid", myOplitis.id);
            SqlDataReader myDtr = null;
            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.ToString();
            }

            return myDtr;
        }
        public SqlDataReader getChangeById(Oplitis myOplitis)
        {
            SqlCommand cmd = new SqlCommand("get_change_by_id", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@opid", myOplitis.id);
            SqlDataReader myDtr = null;
            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.Message.ToString();
            }

            return myDtr;
        }
        public SqlDataReader getLastPliromiById(Oplitis myOplitis)
        {
            SqlCommand cmd = new SqlCommand("get_last_pliromi_by_opid", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@opid", myOplitis.id);
            SqlDataReader myDtr = null;
            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.Message.ToString();
            }

            return myDtr;
        }
        public SqlDataReader getMoney()
        {
            SqlCommand cmd = new SqlCommand("get_money", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader myDtr = null;

            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.ToString();
            }

            return myDtr;
        }

        public SqlDataReader getPliromiById(Pliromi myPliromi)
        {
            SqlCommand cmd = new SqlCommand("get_last_pliromi_by_id", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@pid", myPliromi.PliromiId);
            SqlDataReader myDtr = null;

            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.ToString();
            }

            return myDtr;
        }
        public SqlDataReader getDiaforaPosou(Oplitis myOplitis)
        {
            SqlCommand cmd = new SqlCommand("get_diafora_posou", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@opid", myOplitis.id);
            SqlDataReader myDtr = null;

            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.ToString();
            }

            return myDtr;
        }
        public SqlDataReader getDikaiologitika()
        {
            SqlCommand cmd = new SqlCommand("get_dikaiologitika", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader myDtr = null;

            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.ToString();
            }

            return myDtr;
        }
        public SqlDataReader getRank()
        {
            SqlCommand cmd = new SqlCommand("get_rank", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader myDtr = null;

            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.ToString();
            }

            return myDtr;
        }
        public SqlDataReader getOplitis()
        {
            SqlCommand cmd = new SqlCommand("get_oplitis", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader myDtr = null;
            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.ToString();
            }
            return myDtr;
        }
        public SqlDataReader getKatigoriaById(Oplitis myOplitis)
        {
            SqlCommand cmd = new SqlCommand("get_katigoria_by_oplitis_id", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@opid", myOplitis.id);
            SqlDataReader myDtr = null;
            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.ToString();
            }
            return myDtr;
        }
        public SqlDataReader getMisthodosia()
        {
            SqlCommand cmd = new SqlCommand("get_misthodosia", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader myDtr = null;
            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.ToString();
            }
            return myDtr;
        }
        public SqlDataReader getLastInsertedOplitis()
        {
            SqlCommand cmd = new SqlCommand("get_last_inserted_oplitis", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader myDtr = null;
            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.ToString();
            }
            return myDtr;
        }
        public SqlDataReader getLastUpdatedOplitis()
        {
            SqlCommand cmd = new SqlCommand("get_last_updated_oplitis", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader myDtr = null;
            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.ToString();
            }
            return myDtr;
        }
        public SqlDataReader getLastPliromi()
        {
            SqlCommand cmd = new SqlCommand("get_last_pliromi", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader myDtr = null;
            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.ToString();
            }
            return myDtr;
        }
        public SqlDataReader getLastPliromiByOpid(Oplitis myOplitis)
        {
            SqlCommand cmd = new SqlCommand("get_last_pliromi_by_opid", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@opid", myOplitis.id);
            SqlDataReader myDtr = null;
            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.ToString();
            }
            return myDtr;
        }
        public SqlDataReader getDikaiologitikaPouExeiProskomisei()
        {
            SqlCommand cmd = new SqlCommand("get_dik_pou_exei_proskomisei", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader myDtr = null;
            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.ToString();
            }
            return myDtr;
        }
        public SqlDataReader getDikaiologitikaPouExeiProskomiseiById(Oplitis myOplitis)
        {
            SqlCommand cmd = new SqlCommand("get_dik_pou_exei_proskomisei_by_id", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@opid", myOplitis.id);
            SqlDataReader myDtr = null;
            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.ToString();
            }
            return myDtr;
        }
        public SqlDataReader getLastPayment(Oplitis myOplitis)
        {
            SqlCommand cmd = new SqlCommand("last_payments", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@opid", myOplitis.id);
            SqlDataReader myDtr = null;

            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.ToString();
            }
            return myDtr;
        }
        public void insertFermenaDikaiologitika(Dikaiologitika myDikaiologitika)
        {
            SqlCommand cmd = new SqlCommand("fermena_dikaiologitika", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dikid", myDikaiologitika.id);

            try
            {
                cmd.ExecuteNonQuery();
            }

            catch (Exception ex)
            {
                string exmsg = ex.Message.ToString();
            }

            finally
            {
                conn.Close();
            }
        }
        public SqlDataReader getDikaiologitikaFromKatigoria()
        {
            SqlCommand cmd = new SqlCommand("get_katigoria_from_dikaiologitika", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader myDtr = null;
            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                ex.ToString();
            }
            return myDtr;
        }
        public SqlDataReader getRankByID(Oplitis myOplitis)
        {
            SqlCommand cmd = new SqlCommand("get_rank_by_id", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@opid", myOplitis.id);
            SqlDataReader myDtr = null;

            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                string exmsg = ex.Message.ToString();
            }
            return myDtr;
        }
        public SqlDataReader getLastUpdatedOplitisDik(Oplitis myOplitis)
        {
            SqlCommand cmd = new SqlCommand("get_last_updated_oplitis_dik", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@opid", myOplitis.id);
            SqlDataReader myDtr = null;

            try
            {
                myDtr = cmd.ExecuteReader();
            }

            catch (Exception ex)
            {
                string exmsg = ex.Message.ToString();
            }
            return myDtr;
        }
    }
}