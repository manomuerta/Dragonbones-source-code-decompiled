package _813
{
   import _10259._10258;
   import _10259._10260;
   import _10259._10261;
   import _10259._10433;
   import _10259._10434;
   import _1038._1037;
   import _1045.Button;
   import _1045.CheckBox;
   import _1045.DropDownList;
   import _1045.Group;
   import _1045.HSlider;
   import _1045.Label;
   import _1045._1105;
   import _1185._1188;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _127._151;
   import _127._162;
   import _1374.IconButton;
   import _1404._1407;
   import _51._79;
   import _54._10244;
   import _54._10245;
   import _54._10246;
   import _54._10429;
   import _54._10430;
   import _54._58;
   import _54._63;
   import _54._64;
   import _54._65;
   import _54._67;
   import _586._589;
   import _586._605;
   import _644._645;
   import _644._646;
   import _81._88;
   import _81._91;
   import _822._828;
   import _834._833;
   import _97._125;
   import egret.utils.tr;
   
   public class ActionPropertyGroup extends Group
   {
      private const ICON_MORE:String = "/assets/comic/more.png";
      
      private const ICON_POSTION:String = "/assets/comic/position.png";
      
      private const _10484:String = "/assets/comic/alpha.png";
      
      private const _6147:String = "/assets/comic/rotation.png";
      
      private const _10810:String = "/assets/comic/scale.png";
      
      private const ICON_GROUP:String = "/assets/comic/group.png";
      
      private const ICON_PLUS:String = "/assets/comic/addPlus.png";
      
      private const ICON_SHAKE:String = "/assets/comic/shake.png";
      
      private const ICON_SWING:String = "/assets/comic/swing.png";
      
      private const ICON_HEARTBEAT:String = "/assets/comic/heartbeat.png";
      
      private const ICON_TWINKLE:String = "/assets/comic/twinkle.png";
      
      private const ICON_INVERT:String = "/assets/comic/invert.png";
      
      private const GROUPSPACE:int = 10;
      
      private var _6161:Group;
      
      public var _4051:Button;
      
      private var _6148:Label;
      
      public var _4046:IconButton;
      
      public var _4082:Button;
      
      private var _6141:Group;
      
      private var _6135:Group;
      
      private var _2513:Group;
      
      private var _6168:_1105;
      
      private var _6160:Group;
      
      private var _6139:Group;
      
      private var _6169:Label;
      
      public var _4067:Button;
      
      private var actionGroup:Group;
      
      private var _6170:_1105;
      
      private var _6159:Group;
      
      private var _6142:Group;
      
      private var _6171:Label;
      
      public var _4081:Button;
      
      public var _3754:Button;
      
      private var _6163:Group;
      
      private var _6164:Label;
      
      public var _4077:_162;
      
      private var _6150:Group;
      
      private var _6167:Label;
      
      public var _4068:DropDownList;
      
      private var _6153:_1037;
      
      private var line:_828;
      
      private var _6165:Group;
      
      private var _6166:Label;
      
      private var posX:Label;
      
      private var posY:Label;
      
      public var _4078:_162;
      
      public var _4079:_162;
      
      private var _6143:Group;
      
      private var _6144:Label;
      
      public var _4047:_162;
      
      private var _10407:Group;
      
      private var _10410:Label;
      
      public var _10342:CheckBox;
      
      private var _6158:Group;
      
      private var _6157:Label;
      
      public var _4056:HSlider;
      
      public var _4071:_162;
      
      private var _10413:Label;
      
      private var _6156:Group;
      
      private var _6155:Label;
      
      private var _6172:Label;
      
      private var _6173:Label;
      
      public var _4070:_162;
      
      public var _4069:_162;
      
      public var _10346:_10260;
      
      public var _10345:_10261;
      
      public var _10337:_10258;
      
      public var _10468:_10434;
      
      public var _10469:_10433;
      
      private var _6149:Vector.<_91>;
      
      private var _10416:Boolean = false;
      
      public function ActionPropertyGroup()
      {
         this.speedUpNone = tr("ActionPropertyGroup.none");
         this.speedUpIn = tr("ActionPropertyGroup.in");
         this.speedUpOut = tr("ActionPropertyGroup.out");
         this.speedUpInOut = tr("ActionPropertyGroup.inout");
         this._4051 = new Button();
         this._6148 = new Label();
         this._4046 = new IconButton();
         this._4082 = new Button();
         this._6168 = new _1105();
         this._6169 = new Label();
         this._4067 = new Button();
         this._6170 = new _1105();
         this._6171 = new Label();
         this._4081 = new Button();
         this._3754 = new Button();
         this._6164 = new Label();
         this._4077 = new _162();
         this._6167 = new Label();
         this._4068 = new DropDownList();
         this._6153 = new _1037();
         this._6166 = new Label();
         this.posX = new Label();
         this.posY = new Label();
         this._4078 = new _162();
         this._4079 = new _162();
         this._6144 = new Label();
         this._4047 = new _162();
         this._10410 = new Label();
         this._10342 = new CheckBox();
         this._6157 = new Label();
         this._4056 = new HSlider();
         this._4071 = new _162();
         this._10413 = new Label();
         this._6155 = new Label();
         this._6172 = new Label();
         this._6173 = new Label();
         this._4070 = new _162();
         this._4069 = new _162();
         this._10346 = new _10260();
         this._10345 = new _10261();
         this._10337 = new _10258();
         this._10468 = new _10434();
         this._10469 = new _10433();
         this._6149 = new Vector.<_91>();
         super();
         this._4051.label = tr("ComicPropertyPanel.ShowOperation");
         this._6148.text = tr("ComicPropertyPanel.NoAction");
         this._6148.textColor = 6580589;
         this._6148._2420 = 13;
         this._6148.horizontalCenter = 0;
         this._6148.size = 14;
         this._4046.skinName = _833;
         this._4046.percentWidth = 80;
         this._4046.icon = this.ICON_PLUS;
         this._4046.label = tr("ComicPropertyPanel.AddAction");
         this._4082.label = tr("ComicPropertyPanel.AddAction");
         this._4082.width = 128;
         this.percentHeight = 100;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6161 = _125._2413();
         this.addElement(this._6161);
         this._6161.percentWidth = 100;
         this._6161.percentHeight = 100;
         this._6168.alpha = 0.7;
         this._6168.source = this.ICON_MORE;
         this._6169.size = 14;
         this._6169.text = tr("ComicPropertyPanel.More");
         this._6169._2419 = 10;
         this._4067.label = tr("ActionProperty.preview");
         this._4067.width = 65;
         this._4051.width = 65;
         this._6139 = this._2414();
         this._6139.addElement(this._4051);
         this._6139.addElement(this._4067);
         this._6160 = this._2413();
         this._6160.addElement(this._6169);
         this._6160.addElement(this._6139);
         this._6141 = this._2414();
         this._6141.addElement(this._6168);
         this._6141.addElement(this._6160);
         this._6135 = new Group();
         this._6135.percentWidth = 100;
         var _loc1_:_1197 = new _1197();
         _loc1_._2401 = _1188.CENTER;
         _loc1_.gap = 13;
         _loc1_._2410 = 11;
         this._6135.layout = _loc1_;
         this._4046.horizontalCenter = 0;
         this._6135.addElement(this._6148);
         this._6135.addElement(this._4046);
         this._2513 = _125._2395();
         this._4082.horizontalCenter = 0;
         this._2513.addElement(this._4082);
         this._2513.percentWidth = 100;
         this._6170.alpha = 0.7;
         this._6170.source = this.ICON_POSTION;
         this._6171.size = 14;
         this._6171.text = tr("ActionProperty.postion");
         this._6171._2419 = 10;
         this._4081.label = tr("ActionProperty.change");
         this._3754.label = tr("ActionProperty.preview");
         this._4081.width = 75;
         this._3754.width = 75;
         this._6142 = this._2414();
         this._6142.addElement(this._4081);
         this._6142.addElement(this._3754);
         this._6159 = this._2413();
         this._6159.addElement(this._6171);
         this._6159.addElement(this._6142);
         this.actionGroup = this._2414();
         this.actionGroup.addElement(this._6170);
         this.actionGroup.addElement(this._6159);
         this.line = _125._2417();
         this._6164.text = tr("ActionProperty.time");
         this._4077.x = 50;
         this._4077.percentWidth = 100;
         this._4077.txt.percentWidth = 100;
         this._4077.maxValue = 60;
         this._4077.minValue = 0;
         this._6163 = this._2414();
         this._6163.addElement(this._6164);
         this._6163.addElement(this._4077);
         this._6167.text = tr("ActionProperty.speedup");
         this._4068.percentWidth = 100;
         this._6153.source = [this.speedUpNone,this.speedUpIn,this.speedUpOut,this.speedUpInOut];
         this._4068.dataProvider = this._6153;
         this._4068._3854 = false;
         this._4068.selectedIndex = 0;
         this._6150 = this._2414();
         this._6150.addElement(this._6167);
         this._6150.addElement(this._4068);
         var _loc2_:Group = new Group();
         var _loc3_:Group = new Group();
         _loc2_.percentWidth = 50;
         _loc3_.percentWidth = 50;
         this._6166.text = tr("ActionProperty.move");
         this.posX.text = "X:";
         this.posX.top = 5;
         this._4078.txt.text = "0";
         this._4078.x = 20;
         this._4078.percentWidth = 100;
         this._4078.txt.percentWidth = 100;
         _loc2_.addElement(this.posX);
         _loc2_.addElement(this._4078);
         this.posY.text = "Y:";
         this._4079.txt.text = "0";
         this._4079.x = 20;
         this.posY.top = 5;
         this._4079.percentWidth = 100;
         this._4079.txt.percentWidth = 100;
         _loc3_.addElement(this.posY);
         _loc3_.addElement(this._4079);
         this._6165 = this._2414();
         this._6165.addElement(this._6166);
         this._6165.addElement(_loc2_);
         this._6165.addElement(_loc3_);
         this._6144.text = tr("ActionProperty.rota");
         this._4047.txt.text = "0";
         this._4047.percentWidth = 100;
         this._4047.txt.percentWidth = 100;
         this._6143 = this._2414();
         this._6143.percentWidth = 100;
         this._6143.addElement(this._6144);
         this._6143.addElement(this._4047);
         this._10410.text = tr("ActionPropertyGroup.loop");
         this._10342.selected = true;
         this._10407 = this._2414();
         this._10407.addElement(this._10410);
         this._10407.addElement(this._10342);
         this._6157.text = tr("ActionProperty.alp");
         this._4071.txt.text = "0";
         this._4071.percentWidth = 100;
         this._4071.txt.percentWidth = 100;
         this._4071.maxValue = 100;
         this._4071.minValue = 0;
         this._4071._2579 = 1;
         this._4056.skinName = _151;
         this._4056.maximum = 100;
         this._4056.minimum = 0;
         this._4056.value = 1;
         this._10413.text = "%";
         this._6158 = this._2414();
         this._6158.percentWidth = 100;
         this._6158.addElement(this._6157);
         this._6158.addElement(this._4056);
         this._6158.addElement(this._4071);
         this._6158.addElement(this._10413);
         var _loc4_:Group = new Group();
         var _loc5_:Group = new Group();
         _loc4_.percentWidth = 50;
         _loc5_.percentWidth = 50;
         this._6155.text = tr("ActionProperty.sca");
         this._6172.text = "X:";
         this._6172.top = 5;
         this._4070.txt.text = "1";
         this._4070.x = 20;
         this._4070.percentWidth = 100;
         this._4070.txt.percentWidth = 100;
         _loc4_.addElement(this._6172);
         _loc4_.addElement(this._4070);
         this._6173.text = "Y:";
         this._6173.top = 5;
         this._4069.txt.text = "1";
         this._4069.x = 20;
         this._4069.percentWidth = 100;
         this._4069.txt.percentWidth = 100;
         _loc5_.addElement(this._6173);
         _loc5_.addElement(this._4069);
         this._6156 = this._2414();
         this._6156.percentWidth = 100;
         this._6156.addElement(this._6155);
         this._6156.addElement(_loc4_);
         this._6156.addElement(_loc5_);
         this._4067.enabled = false;
         if(this._10416)
         {
            initialized = true;
            this._2894();
         }
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
      }
      
      public function _2894() : void
      {
         var _loc1_:_645 = null;
         if(!this.initialized)
         {
            this._10416 = true;
            return;
         }
         if(Boolean(this._6149) && this._6149.length > 1)
         {
            this._6136();
            return;
         }
         if(Boolean(this._6149) && this._6149.length == 1)
         {
            if(this._6149[0] is _646)
            {
               if(_646(this._6149[0])._3071 || _646(this._6149[0])._10286)
               {
                  _loc1_ = _646(this._6149[0]).parent;
                  this._10411(_loc1_);
               }
               else
               {
                  this._6151(_646(this._6149[0]).tweens);
               }
            }
            else if(this._6149[0] is _79)
            {
               if(this._3112._4050(this._6149[0] as _79))
               {
                  _loc1_ = this._3112._3567._3116((this._6149[0] as _79).parentBoneData,this._6149[0] as _79);
                  this._10411(_loc1_);
               }
               else
               {
                  this._6140();
               }
            }
         }
         else
         {
            this._6162();
         }
      }
      
      private function _10411(param1:_645) : void
      {
         if(Boolean(param1) && Boolean(param1.tracks))
         {
            if(param1.tracks.length == 1)
            {
               this._6151(param1.tracks[0].tweens);
            }
            else if(param1.tracks.length == 0)
            {
               this._6140();
            }
            else if(this._3558._5116)
            {
               this._6151(param1.tracks[0].tweens);
            }
            else
            {
               this._6136();
            }
         }
      }
      
      private function _6136() : void
      {
         this._6162();
         this._6161.addElement(this._6141);
         this._6161.addElement(this.line);
      }
      
      private function _6140() : void
      {
         this._6162();
         this._6161.addElement(this._6135);
         this._6161.addElement(this.line);
      }
      
      private function _6151(param1:Vector.<_67>) : void
      {
         var _loc3_:_67 = null;
         this._6162();
         var _loc2_:Boolean = false;
         if(param1.length == 0)
         {
            return;
         }
         for each(_loc3_ in param1)
         {
            if(_loc3_ is _10245)
            {
               this._4077.txt.text = _loc3_.during.toFixed(2);
               this._10414(_loc3_ as _10245);
               _loc2_ = true;
            }
         }
         for each(_loc3_ in param1)
         {
            if(_loc3_ is _10246)
            {
               this._4077.txt.text = _loc3_.during.toFixed(2);
               this._10415(_loc3_ as _10246);
               _loc2_ = true;
            }
         }
         for each(_loc3_ in param1)
         {
            if(_loc3_ is _10244)
            {
               this._4077.txt.text = _loc3_.during.toFixed(2);
               this._10412(_loc3_ as _10244);
               _loc2_ = true;
            }
         }
         for each(_loc3_ in param1)
         {
            if(_loc3_ is _10430)
            {
               this._4077.txt.text = _loc3_.during.toFixed(2);
               this._10482(_loc3_ as _10430);
               _loc2_ = true;
            }
         }
         for each(_loc3_ in param1)
         {
            if(_loc3_ is _10429)
            {
               this._4077.txt.text = _loc3_.during.toFixed(2);
               this._10483(_loc3_ as _10429);
               _loc2_ = true;
            }
         }
         for each(_loc3_ in param1)
         {
            if(_loc3_ is _63)
            {
               this._4077.txt.text = _loc3_.during.toFixed(2);
               this._4068.selectedIndex = _loc3_.easing - 1;
               this._6145(_loc3_ as _63);
               _loc2_ = true;
            }
         }
         for each(_loc3_ in param1)
         {
            if(_loc3_ is _64)
            {
               this._4077.txt.text = _loc3_.during.toFixed(2);
               this._4068.selectedIndex = _loc3_.easing - 1;
               this._6138(_loc3_ as _64);
               _loc2_ = true;
            }
         }
         for each(_loc3_ in param1)
         {
            if(_loc3_ is _65)
            {
               this._4077.txt.text = _loc3_.during.toFixed(2);
               this._4068.selectedIndex = _loc3_.easing - 1;
               this._6154(_loc3_ as _65);
               _loc2_ = true;
            }
         }
         for each(_loc3_ in param1)
         {
            if(_loc3_ is _58)
            {
               this._4077.txt.text = _loc3_.during.toFixed(2);
               this._4068.selectedIndex = _loc3_.easing == 0 ? 0 : _loc3_.easing - 1;
               this._6152(_loc3_ as _58);
               _loc2_ = true;
            }
         }
         if(_loc2_)
         {
            this._6161.addElement(this._2513);
         }
         else
         {
            this._6140();
         }
      }
      
      private function _10414(param1:_10245) : void
      {
         this._6171.text = tr("ActionProperty.shake");
         this._6170.source = this.ICON_SHAKE;
         if(!this.actionGroup.parent)
         {
            this._6161.addElement(this.actionGroup);
            this._6161.addElement(this.line);
         }
         if(!this._6163.parent)
         {
            this._6161.addElement(this._6163);
         }
         this._10346.model = param1;
         this._6161.addElement(this._10346);
      }
      
      private function _10415(param1:_10246) : void
      {
         this._6171.text = tr("ActionProperty.swing");
         this._6170.source = this.ICON_SWING;
         if(!this.actionGroup.parent)
         {
            this._6161.addElement(this.actionGroup);
            this._6161.addElement(this.line);
         }
         if(!this._6163.parent)
         {
            this._6161.addElement(this._6163);
         }
         this._10345.model = param1;
         this._6161.addElement(this._10345);
      }
      
      private function _10412(param1:_10244) : void
      {
         this._6171.text = tr("ActionProperty.heartbeat");
         this._6170.source = this.ICON_HEARTBEAT;
         if(!this.actionGroup.parent)
         {
            this._6161.addElement(this.actionGroup);
            this._6161.addElement(this.line);
         }
         if(!this._6163.parent)
         {
            this._6161.addElement(this._6163);
         }
         this._10337.model = param1;
         this._6161.addElement(this._10337);
      }
      
      private function _10482(param1:_10430) : void
      {
         this._6171.text = tr("ActionProperty.twinkle");
         this._6170.source = this.ICON_TWINKLE;
         if(!this.actionGroup.parent)
         {
            this._6161.addElement(this.actionGroup);
            this._6161.addElement(this.line);
         }
         if(!this._6163.parent)
         {
            this._6161.addElement(this._6163);
         }
         this._10468.model = param1;
         this._6161.addElement(this._10468);
      }
      
      private function _10483(param1:_10429) : void
      {
         this._6171.text = tr("ActionProperty.invert");
         this._6170.source = this.ICON_INVERT;
         if(!this.actionGroup.parent)
         {
            this._6161.addElement(this.actionGroup);
            this._6161.addElement(this.line);
         }
         if(!this._6163.parent)
         {
            this._6161.addElement(this._6163);
         }
         this._10469.model = param1;
         this._6161.addElement(this._10469);
      }
      
      private function _6145(param1:_63) : void
      {
         this._6171.text = tr("ActionProperty.postion");
         this._6170.source = this.ICON_POSTION;
         if(!this.actionGroup.parent)
         {
            this._6161.addElement(this.actionGroup);
            this._6161.addElement(this.line);
         }
         if(!this._6163.parent)
         {
            this._6161.addElement(this._6163);
         }
         if(!this._6150.parent)
         {
            this._6161.addElement(this._6150);
         }
         this._4078.txt.text = (param1.position.x + param1._1836.globalTransform.x).toFixed(0);
         this._4079.txt.text = (param1.position.y + param1._1836.globalTransform.y).toFixed(0);
         this._6161.addElement(this._6165);
      }
      
      private function _6152(param1:_58) : void
      {
         this._6171.text = tr("ActionProperty.composite");
         this._6170.source = this.ICON_GROUP;
         if(!this.actionGroup.parent)
         {
            this._6161.addElement(this.actionGroup);
            this._6161.addElement(this.line);
            this._6171.text = tr("ActionProperty.alpha");
            this._6170.source = this._10484;
         }
         if(!this._6163.parent)
         {
            this._6161.addElement(this._6163);
         }
         if(!this._6150.parent)
         {
            this._6161.addElement(this._6150);
         }
         this._4071.txt.text = (param1.alpha * 100).toFixed();
         this._4056.value = param1.alpha * 100;
         this._6161.addElement(this._6158);
      }
      
      private function _6138(param1:_64) : void
      {
         this._6171.text = tr("ActionProperty.composite");
         this._6170.source = this.ICON_GROUP;
         if(!this.actionGroup.parent)
         {
            this._6161.addElement(this.actionGroup);
            this._6161.addElement(this.line);
            this._6171.text = tr("ActionProperty.rotation");
            this._6170.source = this._6147;
         }
         if(!this._6163.parent)
         {
            this._6161.addElement(this._6163);
         }
         if(!this._6150.parent)
         {
            this._6161.addElement(this._6150);
         }
         this._4047.txt.text = ((param1.rotation + param1._1836.globalTransform.rotation) * _88.RADIAN_TO_ANGLE).toFixed(2);
         this._10342.selected = param1.loop;
         this._6161.addElement(this._6143);
         this._6161.addElement(this._10407);
      }
      
      private function _6154(param1:_65) : void
      {
         this._6171.text = tr("ActionProperty.composite");
         this._6170.source = this.ICON_GROUP;
         if(!this.actionGroup.parent)
         {
            this._6161.addElement(this.actionGroup);
            this._6161.addElement(this.line);
            this._6171.text = tr("ActionProperty.scale");
            this._6170.source = this._10810;
         }
         if(!this._6163.parent)
         {
            this._6161.addElement(this._6163);
         }
         if(!this._6150.parent)
         {
            this._6161.addElement(this._6150);
         }
         this._4070.txt.text = param1.scale.x.toFixed(2);
         this._4069.txt.text = param1.scale.y.toFixed(2);
         this._6161.addElement(this._6156);
      }
      
      private function _6162() : void
      {
         if(Boolean(this.line) && Boolean(this.line.parent))
         {
            Group(this.line.parent).removeElement(this.line);
         }
         if(Boolean(this._6141) && Boolean(this._6141.parent))
         {
            Group(this._6141.parent).removeElement(this._6141);
         }
         if(Boolean(this._6135) && Boolean(this._6135.parent))
         {
            Group(this._6135.parent).removeElement(this._6135);
         }
         if(Boolean(this.actionGroup) && Boolean(this.actionGroup.parent))
         {
            Group(this.actionGroup.parent).removeElement(this.actionGroup);
         }
         if(Boolean(this._2513) && Boolean(this._2513.parent))
         {
            Group(this._2513.parent).removeElement(this._2513);
         }
         if(Boolean(this._6163) && Boolean(this._6163.parent))
         {
            Group(this._6163.parent).removeElement(this._6163);
         }
         if(Boolean(this._6165) && Boolean(this._6165.parent))
         {
            Group(this._6165.parent).removeElement(this._6165);
         }
         if(Boolean(this._6143) && Boolean(this._6143.parent))
         {
            Group(this._6143.parent).removeElement(this._6143);
         }
         if(Boolean(this._10407) && Boolean(this._10407.parent))
         {
            Group(this._10407.parent).removeElement(this._10407);
         }
         if(Boolean(this._6158) && Boolean(this._6158.parent))
         {
            Group(this._6158.parent).removeElement(this._6158);
         }
         if(Boolean(this._6156) && Boolean(this._6156.parent))
         {
            Group(this._6156.parent).removeElement(this._6156);
         }
         if(Boolean(this._6150) && Boolean(this._6150.parent))
         {
            Group(this._6150.parent).removeElement(this._6150);
         }
         if(Boolean(this._10346) && Boolean(this._10346.parent))
         {
            Group(this._10346.parent).removeElement(this._10346);
         }
         if(Boolean(this._10345) && Boolean(this._10345.parent))
         {
            Group(this._10345.parent).removeElement(this._10345);
         }
         if(Boolean(this._10337) && Boolean(this._10337.parent))
         {
            Group(this._10337.parent).removeElement(this._10337);
         }
         if(Boolean(this._10468) && Boolean(this._10468.parent))
         {
            Group(this._10468.parent).removeElement(this._10468);
         }
         if(Boolean(this._10469) && Boolean(this._10469.parent))
         {
            Group(this._10469.parent).removeElement(this._10469);
         }
      }
      
      public function get _4080() : Vector.<_91>
      {
         return this._6149;
      }
      
      public function set _4080(param1:Vector.<_91>) : void
      {
         this._6149 = param1;
      }
      
      private function _2414() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         var _loc2_:_1189 = new _1189();
         _loc2_.verticalAlign = _1196.MIDDLE;
         _loc2_.padding = this.GROUPSPACE;
         _loc2_._2410 = 5;
         _loc1_.layout = _loc2_;
         return _loc1_;
      }
      
      private function _2413() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         var _loc2_:_1197 = new _1197();
         _loc1_.layout = _loc2_;
         return _loc1_;
      }
      
      private function get _3112() : _589
      {
         return _1407.getInstance(_589) as _589;
      }
      
      private function get _3558() : _605
      {
         return _1407.getInstance(_605) as _605;
      }
      
      public function get _10339() : DropDownList
      {
         return this._10346._10409;
      }
      
      public function get _10329() : DropDownList
      {
         return this._10346._10403;
      }
      
      public function get _10326() : DropDownList
      {
         return this._10346._10404;
      }
      
      public function get _10343() : CheckBox
      {
         return this._10346._10342;
      }
      
      public function get _10338() : DropDownList
      {
         return this._10345._10409;
      }
      
      public function get _10328() : DropDownList
      {
         return this._10345._10403;
      }
      
      public function get _10344() : CheckBox
      {
         return this._10345._10342;
      }
      
      public function get _10327() : DropDownList
      {
         return this._10337._10409;
      }
      
      public function get _10309() : DropDownList
      {
         return this._10337._10403;
      }
      
      public function get _10310() : DropDownList
      {
         return this._10337._10404;
      }
      
      public function get _10336() : CheckBox
      {
         return this._10337._10342;
      }
      
      public function get _10464() : DropDownList
      {
         return this._10468._10409;
      }
      
      public function get _10466() : CheckBox
      {
         return this._10468._10342;
      }
      
      public function get _10465() : DropDownList
      {
         return this._10469._10409;
      }
      
      public function get _10467() : CheckBox
      {
         return this._10469._10342;
      }
   }
}

