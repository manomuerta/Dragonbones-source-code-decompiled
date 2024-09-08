package _813
{
   import _1038._1037;
   import _1045.Button;
   import _1045.DropDownList;
   import _1045.Group;
   import _1045.Label;
   import _1045._1105;
   import _1185._1188;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _127._162;
   import _1374.IconButton;
   import _1404._1407;
   import _51._79;
   import _54._10242;
   import _54._10243;
   import _54._67;
   import _586._589;
   import _644._645;
   import _644._646;
   import _81._91;
   import _822._828;
   import _834._833;
   import _97._125;
   import egret.utils.tr;
   
   public class _816 extends Group
   {
      private const ICON_PLUS:String = "/assets/comic/addPlus.png";
      
      private const ICON_POSTION:String = "/assets/comic/position.png";
      
      private const _10484:String = "/assets/comic/alpha.png";
      
      private const _10810:String = "/assets/comic/scale.png";
      
      private const ICON_JIANYIN:String = "/assets/comic/jianyin.png";
      
      private const GROUPSPACE:int = 10;
      
      public var _6148:Label;
      
      public var _4046:IconButton;
      
      private var _6161:Group;
      
      private var _6135:Group;
      
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
      
      public var _6153:_1037;
      
      private var _6174:Group;
      
      private var _6175:Label;
      
      public var _4072:DropDownList;
      
      public var _6177:_1037;
      
      private var line:_828;
      
      private var line2:_828;
      
      private var _6176:Vector.<_91>;
      
      private var _10416:Boolean = false;
      
      public function _816()
      {
         this.speedUpNone = tr("ActionPropertyGroup.none");
         this.speedUpIn = tr("ActionPropertyGroup.in");
         this.speedUpOut = tr("ActionPropertyGroup.out");
         this.speedUpInOut = tr("ActionPropertyGroup.inout");
         this.DIRECT_LEFT = tr("AppearProperty.left");
         this.DIRECT_RIGHT = tr("AppearProperty.right");
         this._6148 = new Label();
         this._4046 = new IconButton();
         this._6170 = new _1105();
         this._6171 = new Label();
         this._4081 = new Button();
         this._3754 = new Button();
         this._6164 = new Label();
         this._4077 = new _162();
         this._6167 = new Label();
         this._4068 = new DropDownList();
         this._6153 = new _1037();
         this._6175 = new Label();
         this._4072 = new DropDownList();
         this._6177 = new _1037();
         this._6176 = new Vector.<_91>();
         super();
         this._6148.text = tr("ComicPropertyPanel.NoAction");
         this._6148.textColor = 6580589;
         this._6148._2420 = 13;
         this._6148.horizontalCenter = 0;
         this._6148.size = 14;
         this._4046.skinName = _833;
         this._4046.percentWidth = 80;
         this._4046.icon = this.ICON_PLUS;
         this._4046.label = tr("ComicPropertyPanel.AddAction");
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6161 = _125._2413();
         this.addElement(this._6161);
         this._6161.percentWidth = 100;
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
         this._6170.alpha = 0.7;
         this._6170.source = this.ICON_POSTION;
         this._6171.size = 14;
         this._6171.text = tr("AppearProperty.postion");
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
         this.actionGroup.left = 20;
         this.actionGroup.addElement(this._6170);
         this.actionGroup.addElement(this._6159);
         this.line = _125._2417();
         this.line2 = _125._2417();
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
         this._6167.text = tr("ActionProperty.speedup");
         this._4068.percentWidth = 100;
         this._6153.source = [this.speedUpNone,this.speedUpIn,this.speedUpOut,this.speedUpInOut];
         this._4068.dataProvider = this._6153;
         this._4068._3854 = false;
         this._4068.selectedIndex = 0;
         this._6150 = this._2414();
         this._6150.addElement(this._6167);
         this._6150.addElement(this._4068);
         this._6175.text = tr("AppearProperty.flyType");
         this._4072.percentWidth = 100;
         this._6177.source = [this.DIRECT_LEFT,this.DIRECT_RIGHT];
         this._4072.dataProvider = this._6177;
         this._4072._3854 = false;
         this._4072.selectedIndex = 0;
         this._6174 = this._2414();
         this._6174.addElement(this._6175);
         this._6174.addElement(this._4072);
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
         var _loc2_:_645 = null;
         if(!this.initialized)
         {
            this._10416 = true;
            return;
         }
         this._4046.enabled = true;
         if(Boolean(this._6176) && this._6176.length > 1)
         {
            this._6162();
            return;
         }
         if(Boolean(this._6176) && this._6176.length == 1)
         {
            if(this._6176[0] is _79)
            {
               _loc1_ = this._3112._3567._3116((this._6176[0] as _79).parentBoneData,this._6176[0] as _79);
               if(_loc1_._10287)
               {
                  this._6151(_loc1_._10287.tweens);
               }
               else
               {
                  this._6140();
               }
            }
            else if(this._6176[0] is _646)
            {
               _loc2_ = (this._6176[0] as _646).parent;
               if(_loc2_._10287)
               {
                  this._6151(_loc2_._10287.tweens);
               }
               else
               {
                  this._6140();
               }
            }
            else
            {
               this._6140();
               this._4046.enabled = false;
            }
         }
         else
         {
            this._6140();
            this._4046.enabled = false;
         }
      }
      
      private function _6151(param1:Vector.<_67>) : void
      {
         if(param1.length == 0)
         {
            return;
         }
         if(param1[0] is _10243)
         {
            this._6145(param1[0] as _10243);
         }
         else if(param1[0] is _10242)
         {
            this._6152(param1[0] as _10242);
         }
      }
      
      private function _6145(param1:_10243) : void
      {
         this._6162();
         this._6171.text = tr("DisappearProperty.postion");
         this._6170.source = this.ICON_POSTION;
         this._4077.txt.text = param1.during.toFixed(2);
         this._4068.selectedIndex = param1.easing - 1;
         this._4072.selectedIndex = param1.direct;
         this._6161.addElement(this.actionGroup);
         this._6161.addElement(this.line);
         this._6161.addElement(this._6163);
         this._6161.addElement(this._6150);
         this._6161.addElement(this._6174);
      }
      
      private function _6152(param1:_10242) : void
      {
         this._6162();
         this._6171.text = tr("DisappearProperty.alpha");
         this._6170.source = this.ICON_JIANYIN;
         this._4077.txt.text = param1.during.toFixed(2);
         this._4068.selectedIndex = param1.easing - 1;
         this._6161.addElement(this.actionGroup);
         this._6161.addElement(this.line);
         this._6161.addElement(this._6163);
         this._6161.addElement(this._6150);
      }
      
      private function _6140() : void
      {
         this._6162();
         this._6161.addElement(this._6135);
         this._6161.addElement(this.line2);
      }
      
      private function _6162() : void
      {
         if(Boolean(this._6135) && Boolean(this._6135.parent))
         {
            Group(this._6135.parent).removeElement(this._6135);
         }
         if(Boolean(this.line2) && Boolean(this.line2.parent))
         {
            Group(this.line2.parent).removeElement(this.line2);
         }
         if(Boolean(this.actionGroup) && Boolean(this.actionGroup.parent))
         {
            Group(this.actionGroup.parent).removeElement(this.actionGroup);
         }
         if(Boolean(this.line) && Boolean(this.line.parent))
         {
            Group(this.line.parent).removeElement(this.line);
         }
         if(Boolean(this._6163) && Boolean(this._6163.parent))
         {
            Group(this._6163.parent).removeElement(this._6163);
         }
         if(Boolean(this._6150) && Boolean(this._6150.parent))
         {
            Group(this._6150.parent).removeElement(this._6150);
         }
         if(Boolean(this._6174) && Boolean(this._6174.parent))
         {
            Group(this._6174.parent).removeElement(this._6174);
         }
      }
      
      public function get _4080() : Vector.<_91>
      {
         return this._6176;
      }
      
      public function set _4080(param1:Vector.<_91>) : void
      {
         this._6176 = param1;
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
   }
}

