QBٷ���fֹ!��[f�;f�ힳ/!�_�L�s�{i�x���;�q�Gy�y	y��������Z�Oy>�                                                                                                                                                                                                                                                                                                                                                                                                                                                 eIndex_tmp).V_POSITION_Y = [];
        s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_DIRECTION = [];
        s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_SPEED_MAGNITUDE = [];
        s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_IS_MOVING = [];
        s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_DURATION = [];

        previousX = unifrnd(s_input.V_POSITION_X_INTERVAL(1),s_input.V_POSITION_X_INTERVAL(2));
        previousY = unifrnd(s_input.V_POSITION_Y_INTERVAL(1),s_input.V_POSITION_Y_INTERVAL(2));
        previousDuration = 0;
        previousTime = 0;
        Out_setRestrictedWalk_random_waypoint(previousX,previousY,previousDuration,previousTime,s_input);

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%Promenade     
        while (s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_TIME(end) < s_input.SIMULATION_TIME)
            if (s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_IS_MOVING(end) == false)%Maintenant c'est le temps d'�tre mobile
                previousX = s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_POSITION_X(end);
                previousY = s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_POSITION_Y(end);
                previousDuration = s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_DURATION(end);
                previousTime = s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_TIME(end);
                Out_setRestrictedWalk_random_waypoint(previousX,previousY,previousDuration,previousTime,s_input);
            else
                %%%%%%%%Node is taking a pause:
                previousDirection = s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_DIRECTION(end);
                previousSpeed = s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_SPEED_MAGNITUDE(end);
                previousX = s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_POSITION_X(end);
                previousY = s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_POSITION_Y(end);
                previousTime = s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_TIME(end);
                previousDuration = s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_DURATION(end);
                distance = previousDuration*previousSpeed;
                %%%
                s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_TIME(end+1,1) = previousTime + previousDuration;
                s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_POSITION_X(end+1,1) = (previousX + distance*cosd(previousDirection));
                s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_POSITION_Y(end+1,1) = (previousY + distance*sind(previousDirection));
                s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_DIRECTION(end+1,1) = 0;
                s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_SPEED_MAGNITUDE(end+1,1) = 0;
                s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_IS_MOVING(end+1,1) = false;
                s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_DURATION(end+1,1) = Out_adjustDuration_random_waypoint(s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_TIME(end),unifrnd(s_input.V_PAUSE_INTERVAL(1),s_input.V_PAUSE_INTERVAL(2)),s_input);
            end
        end
        %%%%%%%%%%%%%%%%%%To have speed vectors as well rather than
        %%%%%%%%%%%%%%%%%%only the scalar value:
        nb_speed = length(s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_SPEED_MAGNITUDE);
        s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_SPEED_X = zeros(nb_speed,1);
        s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_SPEED_Y = zeros(nb_speed,1);
        for s = 1:nb_speed
            speed = s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_SPEED_MAGNITUDE(s);
            direction = s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_DIRECTION(s);
            s_mobility_tmp.VS_NODE(nodeIndex_tmp).V_SPEED_X(s) =MATLAB 5.0 MAT-file, Platform: PCWIN64, Created on: Wed May 08 22:00:30 2019                                                 IM   &O  x�lWwT�a�/�ad��J�(+�AeR��D�Y��gC�B$!���"�D%-������*���}�y��<������Ͻ��<�<:***��**��"����F��^���
ۇK��U4�ǧC,�ĥHT|I>�����>���O���;0��~��O�c}V�����������9w��tYH�q �Ev_�0c�N�� ����ze| ̢ZM�H]#��T���垃J�_:�(�O	ǝ�Q/��x���9�U	���ۜ>+QE�J;\������J�{��Q��nY��R%Mխd�Jp&���Q�����J�3s����p��d%"�7\OPB��M��4���}7;Z	�����+CH�Vb���ïdJ$T�{�
��p�h;S�l���Q%L��W�F��&u%��[��E�̸���7-����+QT�D��V�����+�hl:O�T�-v��K&JP���fh���8������dҕ��&]h���&��f�J��<Q�A��N��W��ۃ�~�T@h����K��l��rs[-J>)�zd��v�#����X�@���+�����e�ߊ�^�/T  �^�W�~�.M�3�}wL��
H�j�'+�Gw�+A��.�ngR?5&?Z�?�g̞wD��
r��C
����X�P i��BB�N�`�%�X�	]�"��U��
\�js���g1���M���o�ۮ@]ƺt�f��ySc���_Ң�F�בC�)���U�����ؚ5Q�"*$c
�\ݾ�P�|���[�Xu6`l�Rwx��F+���6?N���p�Аq��_r,�����[���\�79zv4��j���U)7��/�'�O|-��]�ץ�ȱ�(�خ\������rT&WM*ʗc4ٳ@qO�]���6rķ
��N���zNv�F~'��/�!2���$N���[�O���}Cf�F4'L��f�_aJ9��w������Α�6h�����}}����V���v�c���m;�8ݧ5'r��W3��N�y�K����5xY��\�KÁ��rH�5�L�X�XJ	6�Cc[�/{C9��g�k��87uJ�96�7Z�T�.�Αr�8;&=�a��̢�2���1�U�]m�j�vv��wj~��^TѫK2��)Z�F�oFW?=����o�
��ޕ��`�sow�W��o:ޗ�����Ȓalz@��[2�O��"�����\���Izꏳ2lL�;#CZZ���Qf處��Ryy��@��-B�Jd���������;K�k5�iT�eа�y'�/�w�Sk=d蠎��u�aߖ���N2�[t4��F��U����b\���F���u!o�e��?�B�"v:�D�[v�Y�2MS�l8S�h�Ѻ�2H6�3�#ꮺ"�ё����!\mb.���V���6Y���A)by���~)^Դ�ͺ�0\�Az�&'�r��I����F�pS����v��ɪ��Ļ%ܫ\�9�c;FKݺtGZ�M�wvߓ�?"C��W�7R�X���k��l�'H1����g��=Y;����ɜ?G�X�#�.)D��S�+��R�*�}9^,���W���f���B�L;~�$�����RL�h9�G���'s�"^/d')���?��(Ÿ�;�����rꚍֽ��XK!����B��Æ�"L����Sk,EĺrK�R���x�@�zS߬�zR�p	��#EvܑL-�+��:B���i�A	�����I`fC�u�g�4r�$���rq����{��%(�Z~��+	f�G�j��%�Q�?�\||,��bm����f��=�$�{)�75Cûi��R%H���07Y�9B���$Hp�v�3N�7v�8)��c_ͧEI��~�
�`�˓[$����x(���=eMO���A)	��sJ�R$Țf8�����ۃ=%��u�2b�~�ؓ�]�u���|�,���1©v~��D/[	��2ߗ�� w���,���Q��5kRw$/������{�Hpl�I���=�6\0��[�N�8A�zK���h	X%����$��u"m�?1.��d�a��`vo�w�*�7w�a_a�_�,Ƴ�	E՟�p��(~T/F�l֓�bx��.O��2����-����#1���X�'���)a�b$<�78�.F3�r4-U����d1X���7��1�l���q�^�1l=ǽ�t����uM�R.t��ĸ�4����8�6d���3�l1؟7�U�� e^���D�84�b���]>�c��g-�]�XU3�E�61^azd�&1���c��ҡ��b���N\&Ym+�B���M�H���s��[v����X�����bl�=�䭉D��s'���$�^�1��Ў1z��f�a�9�ۄ>��xF�|ag�Sц6����y5���v���"h�=��5q�x!B�w��*E����_*��O�·D>7�0+W�=-YӳE�x�燦� |^�ו*B�CM�{��r�>(�(�U����E��ґs�YS���=&��)�ˤ�"�\��q�!�s�?�)E�|~���X��R�Q<&,yst9C�ߙ��cX�v��EuZ,�����]n"4�H�;�,�i��=o���^����A��)�5�n���o#�����Y�Dq���B�C����PP�~6���%q��L��Tg�a�f��sw�a��%��4E8�.~��t�Ԯ���0�[��/Ĩ�����B%6���B|��T��J�{��>
�5�ϰ^�kL�K!
��.�B+L2g�S!ƉV��z,D���q.B�=���#D��*/#K?�8��[B,^i�Ծ&DˢR?��B����b넟䣧�X7��(Z�Y�{�����e��P!ܝ�x	�h�Qq2C"D�FaY'O��I�m��B�\w�D����Y��������B�y��=�.�=�f��}��Ѝ�/��f�����\T�	1c{��F�ۯV�c���M׺�\�-C�}cL��_���X��s.�����\�Ȿ�-n��M"m�Ń�c�PጒI4���b��*D䙂�޿�N��7����m���v�W�}��K��_p�[���� I�C�����s�V���7��*=t̍���8��� W�?��`���>�{��Q(��H���O�/�"��;�M��`�Z�����`�o� 뢫���`���{�tR�l�
�"�ƨ?@�����*� K��H�Ai;�`�*�z�����5d���z@ �/r'��oѤ�p���a��� �#˞n����p��dc�=:F�}�Ɇ��n���Z����Nxn�]�m"��).I3�
��fx�LR�5�{�S���'��-���:E��T[��&��)5b�O>�ᨘ]J�c�Y�^>q�ꎭ��#�i1/��Rz���F>��6��|tl^=��+>�'�V�·��{�
>l�7WM.�CK��P�G����|DMv�:��csS��i|LN�aN*o������`t�>�������ò��4��?i9���ȕ�M���A��Q�C|��,��(���9������#��|���ޟ��g~��S�Y�3�Շq�B���:��q�è����3�wC�{+�W�Fr>nT��:>�J�N���^�9y�2>r��s,]g{�1��f��<>�G����Gċ�%���ػ���n2���j�'���r|ߕ1�U��$�|����#�qͰ��Y��x���k���3A�	]<�o�.��C��QYߚx��}vMm�+co�%�1KS���av���,�.�_�É�rs)]cI��xĽg��7��?ˬ�_���-I���wx��;I��6�c�1�y𬘞�K�a���!��<,Pe��,�֮�S<�m{xl�q">��i�a�Tު�	�a�[_[N >����Rh��v>U�;���x�;2|��C����H<���U-x?I)'5�<y�i_��ƃԢst�3͂x�#;r7NPl�!K�OW��C�˓ekx���n ]��Ϛ�i��<xLN5/&�y��-�ai���И����3	~S���<�qƘ�&��.��b�x�ɖ���\��Y�5x����s�����Ԣ�[��z�O{�7�!?���͸�]-\�M74���E�������l��yͅ�#e��.��oө���ِм'\��ϣ?������|.^ZU�<�ǅ��A&�=����bs�n��\<��H3�2�ҥ#�%p1<M���!g��KNrq���x���E�ϓ�7�q�P�$l������I�HPK-��sa>������Պ��4.����r�}�_{��\\�r<4ɓ�1I��q�r�Z����~�.G��r��1����~�q�-�9�	=S���Y�Ż�m�.v�.����{�������?c.��b�֙�޷�?�M��z���I\�,;h`<��W�Z:��k	ac4�@�-�A��ŧ�5������7ї�9�L������:�~F�t���p@q��\���H���8�Uk�P��1��o/8�Y0�����eo�q�w��s�9h;��6�����=��,��Lv��!�Q&�K�8E�h�r0cGr�P2o�W|�����	���9��i�!��sѳ�hn���vGr�^|<u8��܄�H�`q�X�Q���&�&?1��wcxl7�:��I��]�F�``���2Bm*m?�-/��=9��A6{������);9X��`�>'�ntf�m�������9��X�i��Y������Jo/���s�5� ҺkF�	��'}P��������96��=4��'��x<���F���t9��9ؼM�S�&W�9�d�����A�x��}*4�S�T�����:g�_l��=�e�z�c��N6�u���le�j���&6.�%�l�+��{�I#�G���'[�h��,��ӳ����^%l0W����q���CY.�-�e��������F�-7�ٴ����߱.&���(���-�ʭ���^�e\J,�[''G���gӒ�Ql����/	g��Ǹ�`6r���Vu��vIb6&��S�y�^�=�Øl�������z�g�/_�X��z��n	�`c��׸������)'�kӓ\���!���t`cM޶�[ױ��lc���W�>�,g#iю��Kؠ�M1e�*���φ�9gJ�����og�q~�Ѝ2}b�\���sضh�M6j�u�R��ذj��u6�2�,���]��ca��`��v�6m�YP1�Y�����3L/V��6��6�-�Q�,LP��e���}���R��/��`���Xz���F��|V� ҆J"�E,쩕L[�d!ɖ�rޗ��#7��d�]��]��,4W^�Ăe�J;׵,4�;��YFԩ��6����f�6���OM�SY`��k�O ��:Θ�ł�,��=̄�z���>&��%ڟ�`�]ʉ8e,����3���v�s&�O�-cb����B&�v˿�eb�W�#�7�g��p;�	�?�,N�3q:D�����������۹`"�ܶ^�D��MZ&������2�붩��'�/N߫�u�٥�-L�����b2�ie˙h<����b&�Ui��e�u�jѽiLܙh��3�	)s$Y����0�O���+�X}8/9����o��GP�|������0��3����)e`l%�<�Z���=Yd/�h����.k3�%�S�/�:�@㓾KG	�o:�Cx5f���2���iO�2���#�-�W>��yo*OGq��1�t?�m�����l`��ӱ�d���Y2����M��uwڋ�}~4Vo2�T���0�4�pS�wڴ���o]��Q{���uԙ�(M'|����c����n��\ᏸ�����C3��ߜ����Y��$���W'_��oͭ����7��1�0q�4�;�Ճ�qh|���?���|w�Ꮲz��ڃ��+�ɰ���FJ���;�����y���E�Y��k�>-+\YٿYb��ׁ/~��GG��'w�?��[��ɬ�+��p~t=���:>6��!hhF��V?�.����qY�<���C�M��*?(������j�L���AO�3�%s_���[�8٩~н@M����GiF���z��`?�[�ftK������	?$�r,YA��}Y@��3�������8Ve�6B�� g��<����	={�ì���&�i��f̝��T�����^(���zIu��&�&�ѡ%�Z���S�*n������D�O�L��z:�4�='p�k�7?�ÛJ�O-�C���;-��P��|Tw�d�ծ�1S2Tw����5;M��Ɲ�G��R6?�Jǲn-z����������8�υNǄG���#�������ط%�^g;�}cF���cx�����tXY9maE��%���.�#��2�lD����s蘘ؙ�`����k���˜5F����O5(~Ѱ�E���E��O��t�a������4�=�h쩥�r����r^o	:6��Fp<���4��N��j89l�U(<��@�ρƋ7bi��O�EC���msBh�t^k�,�a����t.�wk�i�h]�CC���[vӰr�[?�"j�o�n�A8=Q�����JO�e4Lu�\�Ō��?��D|r\S�4�-Y��k"/�^}�EC M@
T��$T��x���KYd�n*y;[�Z��mN�x��
}��nuT����l���Z�/�~1��&-�ɣ���e���yܦ�ߠ�h�)ID�w����XB<b�XF�k8B�&m7����~�I	��������t�Rq�r��o*^D.s�����'ۨ��mu�ng6�c�BϘ.U�5.���c̨p(��1�������7N'�����R�.+����TV;���b^۫���<U���������'�LZ����_zɯ)��