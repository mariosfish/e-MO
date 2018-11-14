using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using Web_Misthodosia_Opliton;

namespace Web_Misthodosia_Opliton
{
    public class BLayer
    {
        public BLayer() { }
        public decimal anadromikaCalcLogoKatigorias(Oplitis myOplitis)
        {
            Katigoria myKatigoria = new Katigoria();
            Change myChange = new Change();
            BLayer myBlayer = new BLayer();
            myKatigoria = myBlayer.get_diafora_posou(myOplitis);
            decimal poso = myKatigoria.katDiafora;
            myChange = myBlayer.getChangeById(myOplitis);
            DateTime isxysMetabolis = myChange.changeIsxysDate;
            DateTime metaboliDate = myChange.changeDate;
            int monthIsxys = isxysMetabolis.Month;
            int monthMetaboli = metaboliDate.Month;
            int diafora = monthMetaboli - monthIsxys;
            decimal anadromika = poso * diafora;
            return anadromika;
        }
        public decimal anadromikaCalcLogoApousias(Oplitis myOplitis)
        {
            BLayer myBlayer = new BLayer();
            Katigoria category = new Katigoria();
            category = myBlayer.get_Katigoria_By_Id(myOplitis);
            decimal poso = category.katPliroteo;
            Pliromi myPliromi = new Pliromi();
            myPliromi = myBlayer.get_Last_Pliromi_By_Opid(myOplitis);
            DateTime lastPayDate = myPliromi.PayDay;
            DateTime currentDate = DateTime.Now;
            int diafora = currentDate.Month - lastPayDate.Month;
            decimal anadromika = diafora * poso;
            return anadromika;
        }
        public SqlDataReader get_Dikaiologitika()
        {
            Dal myDal = new Dal();
            SqlDataReader dr = myDal.getDikaiologitika();
            return dr;
        }
        public SqlDataReader get_Xrimatikos_Logismos()
        {
            Dal myDal = new Dal();
            SqlDataReader dr = myDal.getXrimatikosLogismos();
            return dr;
        }
        public SqlDataReader get_Biblio_Pliromon()
        {
            Dal myDal = new Dal();
            SqlDataReader dr = myDal.getBiblioPliromon();
            return dr;
        }
        public Katigoria get_Katigoria_From_Dikaiologitika()
        {
            Dal myDal = new Dal();
            Katigoria myKatigoria = new Katigoria();
            DataTable dt = new DataTable();
            SqlDataReader dr = myDal.getDikaiologitikaFromKatigoria();
            if (dr.HasRows)
            {
                dt.Load(dr);
            }
            foreach (DataRow row in dt.Rows)
            {
                myKatigoria.katPerigrafi = row["kat_name"].ToString();
                myKatigoria.katKatalogisteo = Convert.ToDecimal(row["kat_katalogisteo"].ToString());
                myKatigoria.katKratiseis = Convert.ToDecimal(row["kat_kratiseis"].ToString());
                myKatigoria.katPliroteo = Convert.ToDecimal(row["kat_pliroteo"].ToString());
                myKatigoria.katDXmas = Convert.ToDecimal(row["kat_dx"].ToString());
                myKatigoria.katDPasxa = Convert.ToDecimal(row["kat_dp"].ToString());
            }
            return myKatigoria;
        }
        public void add_Fermena_Dikaiologitika(Dikaiologitika FermenaDik)
        {
            Dal myDal = new Dal();
            myDal.insertFermenaDikaiologitika(FermenaDik);
        }
        public void add_Pliromi(Pliromi myPliromi)
        {
            Dal myDal = new Dal();
            myDal.insertPliromi(myPliromi);
        }
        public SqlDataReader get_Katigoria()
        {
            Dal myDal = new Dal();
            SqlDataReader dr = myDal.getKatigoria();
            return dr;
        }
        public SqlDataReader get_Diagrammenos_Oplitis()
        {
            Dal myDal = new Dal();
            SqlDataReader dr = myDal.getDiagrammenosOplitis();
            return dr;
        }
        public SqlDataReader get_Katigoria_From_Change(Oplitis fantaros)
        {
            Dal myDal = new Dal();
            SqlDataReader dr = myDal.getKatigoriaFromChange(fantaros);
            return dr;
        }
        public SqlDataReader get_Oplitis()
        {
            Dal myDal = new Dal();
            SqlDataReader dr = myDal.getOplitis();
            return dr;
        }
        public Katigoria get_Katigoria_By_Id(Oplitis myOplitis)
        {
            Dal myDal = new Dal();
            Katigoria myKatigoria = new Katigoria();
            DataTable dt = new DataTable();
            SqlDataReader dr = myDal.getKatigoriaById(myOplitis);
            if (dr.HasRows)
            {
                dt.Load(dr);
            }
            foreach (DataRow row in dt.Rows)
            {
                myKatigoria.katPerigrafi = row["kat_name"].ToString();
                myKatigoria.katKatalogisteo = Convert.ToDecimal(row["kat_katalogisteo"].ToString());
                myKatigoria.katKratiseis = Convert.ToDecimal(row["kat_kratiseis"].ToString());
                myKatigoria.katPliroteo = Convert.ToDecimal(row["kat_pliroteo"].ToString());
                myKatigoria.katDXmas = Convert.ToDecimal(row["kat_dx"].ToString());
                myKatigoria.katDPasxa = Convert.ToDecimal(row["kat_dp"].ToString());
            }
            return myKatigoria;
        }
        public Oplitis get_Last_Inserted_Oplitis()
        {
            Dal myDal = new Dal();
            Oplitis myOplitis = new Oplitis();
            DataTable dt = new DataTable();
            SqlDataReader dr = myDal.getLastInsertedOplitis();
            if (dr.HasRows)
            {
                dt.Load(dr);
            }
            foreach (DataRow row in dt.Rows)
            {
                myOplitis.id = Convert.ToInt32(row["op_id"].ToString());
                myOplitis.katigoria = row["kat_name"].ToString();
                myOplitis.bathmos = row["r_perigrafi"].ToString();
                myOplitis.eponymo = row["op_eponymo"].ToString();
                myOplitis.onoma = row["op_onoma"].ToString();
                myOplitis.eggrafi = Convert.ToDateTime(row["op_eggrafi"].ToString());
                myOplitis.asm = Convert.ToInt32(row["op_asm"].ToString());
                myOplitis.loxos = row["op_loxos"].ToString();
                myOplitis.paratiriseis = row["op_paratiriseis"].ToString();
                myOplitis.katalogisteo = Convert.ToDecimal(row["kat_katalogisteo"].ToString());
                myOplitis.kratiseis = Convert.ToDecimal(row["kat_kratiseis"].ToString());
                myOplitis.pliroteo = Convert.ToDecimal(row["kat_pliroteo"].ToString());
                myOplitis.dXmas = Convert.ToDecimal(row["kat_dx"].ToString());
                myOplitis.dPasxa = Convert.ToDecimal(row["kat_dp"].ToString());
                myOplitis.fdmDate = Convert.ToDateTime(row["fdmDate"].ToString());

            }
            return myOplitis;
        }
        public Pliromi get_Last_Pliromi()
        {
            Dal myDal = new Dal();
            Pliromi myPliromi = new Pliromi();
            DataTable dt = new DataTable();
            SqlDataReader dr = myDal.getLastPliromi();
            if (dr.HasRows)
            {
                dt.Load(dr);
            }
            foreach (DataRow row in dt.Rows)
            {
                myPliromi.Pliromi_opid = Convert.ToInt32(row["op_id"].ToString());
                myPliromi.PliromiId = Convert.ToInt32(row["p_id"].ToString());
                myPliromi.PayDay = Convert.ToDateTime(row["p_date"].ToString());
                myPliromi.p_opasm = Convert.ToInt32(row["op_asm"].ToString());
                myPliromi.bathmos = row["r_perigrafi"].ToString();
                myPliromi.onoma = row["op_onoma"].ToString();
                myPliromi.eponymo = row["op_eponymo"].ToString();
                myPliromi.loxos = row["op_loxos"].ToString();
                myPliromi.katName = row["kat_name"].ToString();
                myPliromi.katalogisteo = Convert.ToDecimal(row["kat_katalogisteo"].ToString());
                myPliromi.kratiseis = Convert.ToDecimal(row["kat_kratiseis"].ToString());
                myPliromi.pliroteo = Convert.ToDecimal(row["kat_pliroteo"].ToString());
                myPliromi.mPerigrafi = row["m_perigrafi"].ToString();
                float temp = Convert.ToSingle(row["p_posoPliromis"].ToString());
                myPliromi.Poso = Convert.ToDecimal(temp);
            }
            return myPliromi;
        }
        public Pliromi get_Last_Pliromi_By_Opid(Oplitis myOplitis)
        {
            Dal myDal = new Dal();
            Pliromi myPliromi = new Pliromi();
            DataTable dt = new DataTable();
            SqlDataReader dr = myDal.getLastPliromiByOpid(myOplitis);
            if (dr.HasRows)
            {
                dt.Load(dr);
            }
            foreach (DataRow row in dt.Rows)
            {
                myPliromi.Pliromi_opid = Convert.ToInt32(row["op_id"].ToString());
                myPliromi.PliromiId = Convert.ToInt32(row["p_id"].ToString());
                myPliromi.PayDay = Convert.ToDateTime(row["p_date"].ToString());
                myPliromi.p_opasm = Convert.ToInt32(row["op_asm"].ToString());
                myPliromi.bathmos = row["r_perigrafi"].ToString();
                myPliromi.onoma = row["op_onoma"].ToString();
                myPliromi.eponymo = row["op_eponymo"].ToString();
                myPliromi.loxos = row["op_loxos"].ToString();
                myPliromi.katName = row["kat_name"].ToString();
                myPliromi.katalogisteo = Convert.ToDecimal(row["kat_katalogisteo"].ToString());
                myPliromi.kratiseis = Convert.ToDecimal(row["kat_kratiseis"].ToString());
                myPliromi.pliroteo = Convert.ToDecimal(row["kat_pliroteo"].ToString());
                myPliromi.mPerigrafi = row["m_perigrafi"].ToString();
                if (string.IsNullOrEmpty(row["p_posoPliromis"].ToString()))
                {
                    myPliromi.Poso = Convert.ToDecimal("0,00");
                }
                else
                    myPliromi.Poso = Convert.ToDecimal(row["p_posoPliromis"].ToString());
            }
            return myPliromi;
        }
        public Oplitis get_last_updated_oplitis()
        {
            Dal myDal = new Dal();
            Oplitis myOplitis = new Oplitis();
            DataTable dt = new DataTable();
            SqlDataReader dr = myDal.getLastUpdatedOplitis();
            if (dr.HasRows)
            {
                dt.Load(dr);
            }
            foreach (DataRow row in dt.Rows)
            {
                myOplitis.id = Convert.ToInt32(row["op_id"].ToString());
                myOplitis.katigoria = row["kat_name"].ToString();
                myOplitis.bathmos = row["r_perigrafi"].ToString();
                myOplitis.eponymo = row["op_eponymo"].ToString();
                myOplitis.onoma = row["op_onoma"].ToString();
                myOplitis.asm = Convert.ToInt32(row["op_asm"].ToString());
                myOplitis.loxos = row["op_loxos"].ToString();
                myOplitis.paratiriseis = row["op_paratiriseis"].ToString();
                myOplitis.katalogisteo = Convert.ToDecimal(row["kat_katalogisteo"].ToString());
                myOplitis.kratiseis = Convert.ToDecimal(row["kat_kratiseis"].ToString());
                myOplitis.pliroteo = Convert.ToDecimal(row["kat_pliroteo"].ToString());
                myOplitis.dXmas = Convert.ToDecimal(row["kat_dx"].ToString());
                myOplitis.dPasxa = Convert.ToDecimal(row["kat_dp"].ToString());
                myOplitis.metaboli = Convert.ToDateTime(row["op_metaboli"].ToString());
                myOplitis.isxysDate = Convert.ToDateTime(row["c_isxys_date"].ToString());
            }
            return myOplitis;
        }
        public SqlDataReader get_last_payment(Oplitis myOplitis)
        {
            Dal myDal = new Dal();
            SqlDataReader myDtr = myDal.getLastPayment(myOplitis);
            return myDtr;
        }
        public SqlDataReader get_Misthodosia()
        {
            Dal myDal = new Dal();
            SqlDataReader myDtr = myDal.getMisthodosia();
            return myDtr;
        }
        public SqlDataReader get_Rank()
        {
            Dal myDal = new Dal();
            SqlDataReader dr = myDal.getRank();
            return dr;
        }
        public SqlDataReader get_dikaiologitika_pou_exei_proskomisei()
        {
            Dal myDal = new Dal();
            SqlDataReader dr = myDal.getDikaiologitikaPouExeiProskomisei();
            return dr;
        }
        public SqlDataReader get_dikaiologitika_pou_exei_proskomisei_by_id(Oplitis myOplitis)
        {
            Dal myDal = new Dal();
            SqlDataReader dr = myDal.getDikaiologitikaPouExeiProskomiseiById(myOplitis);
            return dr;
        }
        public SqlDataReader get_pliromi_diagrammenou_opliti_by_id_opliti(Oplitis myOplitis)
        {
            Dal myDal = new Dal();
            SqlDataReader dr = myDal.getPliromiDiagarammenouOplitiByIdOpliti(myOplitis);
            return dr;
        }
        public Katigoria get_diafora_posou(Oplitis myOplitis)
        {
            Dal myDal = new Dal();
            Katigoria myKatigoria = new Katigoria();
            SqlDataReader dr = myDal.getDiaforaPosou(myOplitis);
            DataTable dt = new DataTable();
            if (dr.HasRows)
            {
                dt.Load(dr);
            }
            foreach (DataRow row in dt.Rows)
            {
                myKatigoria.katDiafora = Convert.ToDecimal(row["diafora"].ToString());
                myKatigoria.katPliroteoNew = Convert.ToDecimal(row["katPliroteo_new"].ToString());
                myKatigoria.katPliroteoOld = Convert.ToDecimal(row["katPliroteo_old"].ToString());
                myKatigoria.newKatName = row["katName_new"].ToString();
                myKatigoria.oldKatName = row["katName_old"].ToString();
            }
            return myKatigoria;
        }
        public void addOplitis(Oplitis fantaros)
        {
            Dal myDal = new Dal();
            myDal.insertOplitis(fantaros);
        }
        public void deleteOplitis(Oplitis fantaros)
        {
            Dal myDal = new Dal();
            myDal.deleteOplitis(fantaros);
        }
        public void updateOplitis(Oplitis fantaros)
        {
            Dal myDal = new Dal();
            myDal.updateOplitis(fantaros);
        }
        public List<Katigoria> getMoney()
        {
            Dal myDal = new Dal();
            DataTable dt = new DataTable();
            List<Katigoria> category = new List<Katigoria>();
            SqlDataReader mSq = myDal.getMoney();
            if (mSq.HasRows)
            {
                dt.Load(mSq);
            }
            foreach (DataRow dr in dt.Rows)
            {
                Katigoria myKatigoria = new Katigoria();
                myKatigoria.katId = Convert.ToInt32(dr["kat_id"].ToString());
                myKatigoria.katPerigrafi = dr["kat_name"].ToString();
                myKatigoria.katKatalogisteo = Convert.ToDecimal(dr["kat_katalogisteo"].ToString());
                myKatigoria.katKratiseis = Convert.ToDecimal(dr["kat_kratiseis"].ToString());
                myKatigoria.katPliroteo = Convert.ToDecimal(dr["kat_pliroteo"].ToString());
                myKatigoria.katDXmas = Convert.ToDecimal(dr["kat_dx"].ToString());
                myKatigoria.katDPasxa = Convert.ToDecimal(dr["kat_dp"].ToString());
                category.Add(myKatigoria);
            }
            return category;
        }
        public Oplitis getRankById(Oplitis myOplitis)
        {
            Dal myDal = new Dal();
            SqlDataReader dr = myDal.getRankByID(myOplitis);
            DataTable dt = new DataTable();
            if (dr.HasRows)
            {
                dt.Load(dr);
            }
            foreach (DataRow row in dt.Rows)
            {
                myOplitis.rankID = Convert.ToInt32(row["op_rid"].ToString());
            }
            return myOplitis;
        }
        public Change getChangeById(Oplitis myOplitis)
        {
            Dal myDal = new Dal();
            Change myChange = new Change();
            SqlDataReader dr = myDal.getChangeById(myOplitis);
            DataTable dt = new DataTable();
            if (dr.HasRows)
            {
                dt.Load(dr);
            }
            foreach (DataRow row in dt.Rows)
            {
                myChange.changeId = Convert.ToInt32(row["c_id"].ToString());
                myChange.changeDate = Convert.ToDateTime(row["c_date"].ToString());
                myChange.changeOldKatid = Convert.ToInt32(row["kat_id_old"].ToString());
                myChange.changeOpid = Convert.ToInt32(row["c_opid"].ToString());
                myChange.changeIsxysDate = Convert.ToDateTime(row["c_isxysDate"].ToString());
            }
            return myChange;
        }
        public SqlDataReader get_last_updated_oplitis_dik(Oplitis myOplitis)
        {
            Dal myDal = new Dal();
            SqlDataReader dr = myDal.getLastUpdatedOplitisDik(myOplitis);
            return dr;
        }

        public Pliromi get_Pliromi_By_Id(Pliromi myPliromi)
        {
            Dal myDal = new Dal();
            Pliromi otherPliromi = new Pliromi();
            DataTable dt = new DataTable();
            SqlDataReader dr = myDal.getPliromiById(myPliromi);
            if (dr.HasRows)
            {
                dt.Load(dr);
            }
            foreach (DataRow row in dt.Rows)
            {
                otherPliromi.Pliromi_opid = Convert.ToInt32(row["op_id"].ToString());
                otherPliromi.PliromiId = Convert.ToInt32(row["p_id"].ToString());
                otherPliromi.PayDay = Convert.ToDateTime(row["p_date"].ToString());
                otherPliromi.p_opasm = Convert.ToInt32(row["op_asm"].ToString());
                otherPliromi.bathmos = row["r_perigrafi"].ToString();
                otherPliromi.onoma = row["op_onoma"].ToString();
                otherPliromi.eponymo = row["op_eponymo"].ToString();
                otherPliromi.loxos = row["op_loxos"].ToString();
                otherPliromi.katName = row["kat_name"].ToString();
                otherPliromi.katalogisteo = Convert.ToDecimal(row["kat_katalogisteo"].ToString());
                otherPliromi.kratiseis = Convert.ToDecimal(row["kat_kratiseis"].ToString());
                otherPliromi.pliroteo = Convert.ToDecimal(row["kat_pliroteo"].ToString());
                otherPliromi.mPerigrafi = row["m_perigrafi"].ToString();
                float temp = Convert.ToSingle(row["p_posoPliromis"].ToString());
                otherPliromi.Poso = Convert.ToDecimal(temp);
            }
            return otherPliromi;
        }
        public int login(string username, string password)
        {
            Dal myDal = new Dal();
            int value = myDal.LogIn(username, password);
            return value;
        }
        public int register(User myUser)
        {
            Dal myDal = new Dal();
            int value = myDal.Register(myUser);
            return value;
        }
    }

    public class Date
    {
        int day, month, year;

        public Date(int day, int month, int year)
        {
            this.day = day;
            this.month = month;
            this.year = year;
        }
        public Date myDate(DateTime myDT)
        {
            day = myDT.Day;
            month = myDT.Month;
            year = myDT.Year;
            Date date = new Date(day,month,year);
            return date; 
        }

        public string toString()
        {
            return day + "/" + month + "/" + year;
        }

    }
    public struct Pliromi
    {
        public int PliromiId { get; set; }
        public DateTime lastPaymentDay { get; set; }
        public DateTime PayDay { get; set; }
        public decimal Poso { get; set; }
        public int pmid { get; set; }
        public string bathmos { get; set; }
        public string onoma { get; set; }
        public string eponymo { get; set; }
        public string loxos { get; set; }
        public string katName { get; set; }
        public decimal katalogisteo { get; set; }
        public decimal kratiseis { get; set; }
        public decimal pliroteo { get; set; }
        public string mPerigrafi { get; set; }
        public int p_opasm { get; set; }
        public int Pliromi_opid { get; set; }
        public bool Paid { get; set; }
    }
    public struct Dikaiologitika
    {
        public int id { get; set; }
        public string dik_perigrafi { get; set; }
    }
    public struct Rank
    {
        public int rankId { get; set; }
        public string bathmos_perigrafi { get; set; }
    }
    public struct Change
    {
        public int changeId { get; set; }
        public DateTime changeDate { get; set; }
        public DateTime changeIsxysDate { get; set; }
        public int changeOpid { get; set; }
        public int changeOldKatid { get; set; }
    }
    public struct Katigoria
    {
        public int katId { get; set; }
        public string katPerigrafi { get; set; }
        public decimal katKatalogisteo { get; set; }
        public decimal katKratiseis { get; set; }
        public decimal katPliroteo { get; set; }
        public decimal katDXmas { get; set; }
        public decimal katDPasxa { get; set; }
        public decimal katDiafora { get; set; }
        public string oldKatName { get; set; }
        public string newKatName { get; set; }
        public decimal katPliroteoOld { get; set; }
        public decimal katPliroteoNew { get; set; }
    }
    public struct Oplitis
    {
        public int id { get; set; }
        public int asm { get; set; }
        public string onoma { get; set; }
        public string eponymo { get; set; }
        public string loxos { get; set; }
        public DateTime eggrafi { get; set; }
        public DateTime diagrafi { get; set; }
        public string paratiriseis { get; set; }
        public string bathmos { get; set; }
        public string katigoria { get; set; }
        public DateTime metaboli { get; set; }
        public DateTime lastPayDay { get; set; }
        public decimal katalogisteo { get; set; }
        public decimal kratiseis { get; set; }
        public decimal pliroteo { get; set; }
        public decimal dXmas { get; set; }
        public decimal dPasxa { get; set; }
        public DateTime fdmDate { get; set; }
        public int rankID { get; set; }
        public DateTime isxysDate { get; set; }
        public int katigoriaFDM { get; set; }
    }
    public struct User
    {
        public string username { get; set; }
        public string password { get; set; }
        public string userRank { get; set; }
        public string userOnoma { get; set; }
        public string userEponymo { get; set; }
        public string userMonada { get; set; }
    }
}