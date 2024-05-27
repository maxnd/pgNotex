PGDMP  (                    {           pgNotex    16.0    16.0 K    [           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            \           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ]           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ^           1262    16454    pgNotex    DATABASE     k   CREATE DATABASE "pgNotex" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "pgNotex";
                max    false            �            1259    16463    attachments    TABLE     �   CREATE TABLE public.attachments (
    id integer NOT NULL,
    id_notes integer NOT NULL,
    ord integer NOT NULL,
    title character varying(250),
    attachment bytea
);
    DROP TABLE public.attachments;
       public         heap    postgres    false            �            1259    16462    attachments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.attachments_id_seq;
       public          postgres    false    216            _           0    0    attachments_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;
          public          postgres    false    215            �            1259    16470    links    TABLE     m   CREATE TABLE public.links (
    id integer NOT NULL,
    id_notes integer NOT NULL,
    link_note integer
);
    DROP TABLE public.links;
       public         heap    postgres    false            �            1259    16469    links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.links_id_seq;
       public          postgres    false    218            `           0    0    links_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;
          public          postgres    false    217            �            1259    16475 	   notebooks    TABLE     �   CREATE TABLE public.notebooks (
    id integer NOT NULL,
    ord integer NOT NULL,
    title character varying(250),
    comments text
);
    DROP TABLE public.notebooks;
       public         heap    postgres    false            �            1259    16474    notebooks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notebooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.notebooks_id_seq;
       public          postgres    false    220            a           0    0    notebooks_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.notebooks_id_seq OWNED BY public.notebooks.id;
          public          postgres    false    219            �            1259    16482    notes    TABLE     �   CREATE TABLE public.notes (
    id integer NOT NULL,
    id_sections integer NOT NULL,
    ord integer NOT NULL,
    title character varying(250),
    modification_date timestamp without time zone,
    text text
);
    DROP TABLE public.notes;
       public         heap    postgres    false            �            1259    16481    notes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.notes_id_seq;
       public          postgres    false    222            b           0    0    notes_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;
          public          postgres    false    221            �            1259    16489    sections    TABLE     �   CREATE TABLE public.sections (
    id integer NOT NULL,
    id_notebooks integer NOT NULL,
    ord integer NOT NULL,
    title character varying(250),
    comments text
);
    DROP TABLE public.sections;
       public         heap    postgres    false            �            1259    16488    sections_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sections_id_seq;
       public          postgres    false    224            c           0    0    sections_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sections_id_seq OWNED BY public.sections.id;
          public          postgres    false    223            �            1259    16496    tags    TABLE     t   CREATE TABLE public.tags (
    id integer NOT NULL,
    id_notes integer NOT NULL,
    tag character varying(50)
);
    DROP TABLE public.tags;
       public         heap    postgres    false            �            1259    16495    tags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.tags_id_seq;
       public          postgres    false    226            d           0    0    tags_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;
          public          postgres    false    225            �            1259    16501    tasks    TABLE       CREATE TABLE public.tasks (
    id integer NOT NULL,
    id_notes integer NOT NULL,
    done smallint,
    title character varying(250),
    start_date date,
    end_date date,
    priority character varying(20),
    resources character varying(250),
    comments text
);
    DROP TABLE public.tasks;
       public         heap    postgres    false            �            1259    16500    tasks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.tasks_id_seq;
       public          postgres    false    228            e           0    0    tasks_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;
          public          postgres    false    227            �           2604    16466    attachments id    DEFAULT     p   ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);
 =   ALTER TABLE public.attachments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    16473    links id    DEFAULT     d   ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);
 7   ALTER TABLE public.links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    16478    notebooks id    DEFAULT     l   ALTER TABLE ONLY public.notebooks ALTER COLUMN id SET DEFAULT nextval('public.notebooks_id_seq'::regclass);
 ;   ALTER TABLE public.notebooks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    16485    notes id    DEFAULT     d   ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);
 7   ALTER TABLE public.notes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    16492    sections id    DEFAULT     j   ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);
 :   ALTER TABLE public.sections ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    16499    tags id    DEFAULT     b   ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);
 6   ALTER TABLE public.tags ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    16504    tasks id    DEFAULT     d   ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);
 7   ALTER TABLE public.tasks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2606    16510    attachments pk_attachments 
   CONSTRAINT     X   ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT pk_attachments PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.attachments DROP CONSTRAINT pk_attachments;
       public            postgres    false    216            �           2606    16512    links pk_links 
   CONSTRAINT     L   ALTER TABLE ONLY public.links
    ADD CONSTRAINT pk_links PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.links DROP CONSTRAINT pk_links;
       public            postgres    false    218            �           2606    16514    notebooks pk_notebooks 
   CONSTRAINT     T   ALTER TABLE ONLY public.notebooks
    ADD CONSTRAINT pk_notebooks PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.notebooks DROP CONSTRAINT pk_notebooks;
       public            postgres    false    220            �           2606    16516    notes pk_notes 
   CONSTRAINT     L   ALTER TABLE ONLY public.notes
    ADD CONSTRAINT pk_notes PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.notes DROP CONSTRAINT pk_notes;
       public            postgres    false    222            �           2606    16518    sections pk_sections 
   CONSTRAINT     R   ALTER TABLE ONLY public.sections
    ADD CONSTRAINT pk_sections PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.sections DROP CONSTRAINT pk_sections;
       public            postgres    false    224            �           2606    16520    tags pk_tags 
   CONSTRAINT     J   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT pk_tags PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.tags DROP CONSTRAINT pk_tags;
       public            postgres    false    226            �           2606    16522    tasks pk_tasks 
   CONSTRAINT     L   ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT pk_tasks PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.tasks DROP CONSTRAINT pk_tasks;
       public            postgres    false    228            �           1259    16528    fki_fk_attachments    INDEX     N   CREATE INDEX fki_fk_attachments ON public.attachments USING btree (id_notes);
 &   DROP INDEX public.fki_fk_attachments;
       public            postgres    false    216            �           1259    16534    fki_fk_links    INDEX     B   CREATE INDEX fki_fk_links ON public.links USING btree (id_notes);
     DROP INDEX public.fki_fk_links;
       public            postgres    false    218            �           1259    16567    fki_fk_links2    INDEX     D   CREATE INDEX fki_fk_links2 ON public.links USING btree (link_note);
 !   DROP INDEX public.fki_fk_links2;
       public            postgres    false    218            �           1259    16540    fki_fk_notes    INDEX     E   CREATE INDEX fki_fk_notes ON public.notes USING btree (id_sections);
     DROP INDEX public.fki_fk_notes;
       public            postgres    false    222            �           1259    16546    fki_fk_sections    INDEX     L   CREATE INDEX fki_fk_sections ON public.sections USING btree (id_notebooks);
 #   DROP INDEX public.fki_fk_sections;
       public            postgres    false    224            �           1259    16552    fki_fk_tags    INDEX     @   CREATE INDEX fki_fk_tags ON public.tags USING btree (id_notes);
    DROP INDEX public.fki_fk_tags;
       public            postgres    false    226            �           1259    16558    fki_fk_tasks    INDEX     B   CREATE INDEX fki_fk_tasks ON public.tasks USING btree (id_notes);
     DROP INDEX public.fki_fk_tasks;
       public            postgres    false    228            �           1259    16581    idx_attachments_id    INDEX     i   CREATE INDEX idx_attachments_id ON public.attachments USING btree (id) WITH (deduplicate_items='false');
 &   DROP INDEX public.idx_attachments_id;
       public            postgres    false    216            �           1259    16559    idx_attachments_ord    INDEX     k   CREATE INDEX idx_attachments_ord ON public.attachments USING btree (ord) WITH (deduplicate_items='false');
 '   DROP INDEX public.idx_attachments_ord;
       public            postgres    false    216            �           1259    16561    idx_attachments_title    INDEX     o   CREATE INDEX idx_attachments_title ON public.attachments USING btree (title) WITH (deduplicate_items='false');
 )   DROP INDEX public.idx_attachments_title;
       public            postgres    false    216            �           1259    16582    idx_links_id    INDEX     ]   CREATE INDEX idx_links_id ON public.links USING btree (id) WITH (deduplicate_items='false');
     DROP INDEX public.idx_links_id;
       public            postgres    false    218            �           1259    16583    idx_notebooks_id    INDEX     e   CREATE INDEX idx_notebooks_id ON public.notebooks USING btree (id) WITH (deduplicate_items='false');
 $   DROP INDEX public.idx_notebooks_id;
       public            postgres    false    220            �           1259    16569    idx_notebooks_ord    INDEX     g   CREATE INDEX idx_notebooks_ord ON public.notebooks USING btree (ord) WITH (deduplicate_items='false');
 %   DROP INDEX public.idx_notebooks_ord;
       public            postgres    false    220            �           1259    16568    idx_notebooks_title    INDEX     k   CREATE INDEX idx_notebooks_title ON public.notebooks USING btree (title) WITH (deduplicate_items='false');
 '   DROP INDEX public.idx_notebooks_title;
       public            postgres    false    220            �           1259    16584    idx_notes_id    INDEX     ]   CREATE INDEX idx_notes_id ON public.notes USING btree (id) WITH (deduplicate_items='false');
     DROP INDEX public.idx_notes_id;
       public            postgres    false    222            �           1259    16570    idx_notes_modification_date    INDEX     {   CREATE INDEX idx_notes_modification_date ON public.notes USING btree (modification_date) WITH (deduplicate_items='false');
 /   DROP INDEX public.idx_notes_modification_date;
       public            postgres    false    222            �           1259    16571    idx_notes_ord    INDEX     _   CREATE INDEX idx_notes_ord ON public.notes USING btree (ord) WITH (deduplicate_items='false');
 !   DROP INDEX public.idx_notes_ord;
       public            postgres    false    222            �           1259    16572    idx_notes_title    INDEX     c   CREATE INDEX idx_notes_title ON public.notes USING btree (title) WITH (deduplicate_items='false');
 #   DROP INDEX public.idx_notes_title;
       public            postgres    false    222            �           1259    16585    idx_sections_id    INDEX     c   CREATE INDEX idx_sections_id ON public.sections USING btree (id) WITH (deduplicate_items='false');
 #   DROP INDEX public.idx_sections_id;
       public            postgres    false    224            �           1259    16574    idx_sections_ord    INDEX     e   CREATE INDEX idx_sections_ord ON public.sections USING btree (ord) WITH (deduplicate_items='false');
 $   DROP INDEX public.idx_sections_ord;
       public            postgres    false    224            �           1259    16573    idx_sections_title    INDEX     i   CREATE INDEX idx_sections_title ON public.sections USING btree (title) WITH (deduplicate_items='false');
 &   DROP INDEX public.idx_sections_title;
       public            postgres    false    224            �           1259    16586    idx_tags_id    INDEX     [   CREATE INDEX idx_tags_id ON public.tags USING btree (id) WITH (deduplicate_items='false');
    DROP INDEX public.idx_tags_id;
       public            postgres    false    226            �           1259    16575    idx_tags_tag    INDEX     ]   CREATE INDEX idx_tags_tag ON public.tags USING btree (tag) WITH (deduplicate_items='false');
     DROP INDEX public.idx_tags_tag;
       public            postgres    false    226            �           1259    16576    idx_tasks_done    INDEX     a   CREATE INDEX idx_tasks_done ON public.tasks USING btree (done) WITH (deduplicate_items='false');
 "   DROP INDEX public.idx_tasks_done;
       public            postgres    false    228            �           1259    16577    idx_tasks_end_date    INDEX     i   CREATE INDEX idx_tasks_end_date ON public.tasks USING btree (end_date) WITH (deduplicate_items='false');
 &   DROP INDEX public.idx_tasks_end_date;
       public            postgres    false    228            �           1259    16587    idx_tasks_id    INDEX     ]   CREATE INDEX idx_tasks_id ON public.tasks USING btree (id) WITH (deduplicate_items='false');
     DROP INDEX public.idx_tasks_id;
       public            postgres    false    228            �           1259    16578    idx_tasks_resources    INDEX     k   CREATE INDEX idx_tasks_resources ON public.tasks USING btree (resources) WITH (deduplicate_items='false');
 '   DROP INDEX public.idx_tasks_resources;
       public            postgres    false    228            �           1259    16579    idx_tasks_start_date    INDEX     m   CREATE INDEX idx_tasks_start_date ON public.tasks USING btree (start_date) WITH (deduplicate_items='false');
 (   DROP INDEX public.idx_tasks_start_date;
       public            postgres    false    228            �           1259    16580    idx_tasks_title    INDEX     c   CREATE INDEX idx_tasks_title ON public.tasks USING btree (title) WITH (deduplicate_items='false');
 #   DROP INDEX public.idx_tasks_title;
       public            postgres    false    228            �           2606    16523    attachments fk_attachments    FK CONSTRAINT     �   ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT fk_attachments FOREIGN KEY (id_notes) REFERENCES public.notes(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 D   ALTER TABLE ONLY public.attachments DROP CONSTRAINT fk_attachments;
       public          postgres    false    222    3502    216            �           2606    16529    links fk_links    FK CONSTRAINT     �   ALTER TABLE ONLY public.links
    ADD CONSTRAINT fk_links FOREIGN KEY (id_notes) REFERENCES public.notes(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 8   ALTER TABLE ONLY public.links DROP CONSTRAINT fk_links;
       public          postgres    false    3502    218    222            �           2606    16562    links fk_links2    FK CONSTRAINT     �   ALTER TABLE ONLY public.links
    ADD CONSTRAINT fk_links2 FOREIGN KEY (link_note) REFERENCES public.notes(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 9   ALTER TABLE ONLY public.links DROP CONSTRAINT fk_links2;
       public          postgres    false    218    3502    222            �           2606    16535    notes fk_notes    FK CONSTRAINT     �   ALTER TABLE ONLY public.notes
    ADD CONSTRAINT fk_notes FOREIGN KEY (id_sections) REFERENCES public.sections(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 8   ALTER TABLE ONLY public.notes DROP CONSTRAINT fk_notes;
       public          postgres    false    3508    222    224            �           2606    16541    sections fk_sections    FK CONSTRAINT     �   ALTER TABLE ONLY public.sections
    ADD CONSTRAINT fk_sections FOREIGN KEY (id_notebooks) REFERENCES public.notebooks(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 >   ALTER TABLE ONLY public.sections DROP CONSTRAINT fk_sections;
       public          postgres    false    220    224    3495            �           2606    16547    tags fk_tags    FK CONSTRAINT     �   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT fk_tags FOREIGN KEY (id_notes) REFERENCES public.notes(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 6   ALTER TABLE ONLY public.tags DROP CONSTRAINT fk_tags;
       public          postgres    false    226    3502    222            �           2606    16553    tasks fk_tasks    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT fk_tasks FOREIGN KEY (id_notes) REFERENCES public.notes(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 8   ALTER TABLE ONLY public.tasks DROP CONSTRAINT fk_tasks;
       public          postgres    false    3502    228    222           