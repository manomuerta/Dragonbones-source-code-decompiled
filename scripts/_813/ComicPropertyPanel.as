package _813
{
   import _1038._1037;
   import _1045.Button;
   import _1045.Group;
   import _1045._1107;
   import _1177.IndexChangeEvent;
   import _1185._1188;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _127._156;
   import _1374._1391;
   import _1404._1407;
   import _555._556;
   import _721._763;
   import _81._91;
   import _818._817;
   import _97._125;
   import egret.utils.tr;
   
   public class ComicPropertyPanel extends _156
   {
      private const APPEAR:String = "Appear";
      
      private const ACTION:String = "Action";
      
      private const DISAPPEAR:String = "Disappear";
      
      public var _4042:_814;
      
      public var _4043:ActionPropertyGroup;
      
      public var _6183:_816;
      
      public var _4028:_815;
      
      public var _2565:_1107;
      
      public var _4048:_1391;
      
      private var _6186:_1037;
      
      private var _6161:Group;
      
      private var _2632:Group;
      
      public var _4065:Button;
      
      private var line:Group;
      
      private var _6176:Vector.<_91>;
      
      private var _6184:_763;
      
      public function ComicPropertyPanel()
      {
         this._4042 = new _814();
         this._4043 = new ActionPropertyGroup();
         this._6183 = new _816();
         this._4028 = new _815();
         this._2565 = new _1107();
         this._4048 = new _1391();
         this._6186 = new _1037();
         this._6161 = new Group();
         this._2632 = new Group();
         this._4065 = new Button();
         this.line = _125._2417();
         this._6176 = new Vector.<_91>();
         super();
         this.title = tr("ComicPropertyPanel.Title");
         this._6186.source = [{
            "label":tr("ComicPropertyPanel.Appear"),
            "data":this.APPEAR,
            "enabled":true
         },{
            "label":tr("ComicPropertyPanel.Action"),
            "data":this.ACTION,
            "enabled":true
         },{
            "label":tr("ComicPropertyPanel.Disappear"),
            "data":this.DISAPPEAR,
            "enabled":true
         }];
         this._4042.percentWidth = 100;
         this._4043.percentWidth = 100;
         this._6183.percentWidth = 100;
         this._2565.addElement(this._4042);
         this._2565.addElement(this._4043);
         this._2565.addElement(this._6183);
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.addElement(this._6161);
         this._6161.percentWidth = 100;
         this._6161.percentHeight = 100;
         this._6161.top = 30;
         var _loc1_:_1197 = new _1197();
         _loc1_.gap = 10;
         _loc1_.verticalAlign = _1196.TOP;
         this._6161.layout = _loc1_;
         this._2632.percentWidth = 100;
         var _loc2_:_1189 = new _1189();
         _loc2_._2401 = _1188.CENTER;
         this._2632.layout = _loc2_;
         this.addElement(this._2632);
         this.line.percentWidth = 80;
         this.line.bottom = 50;
         this.line.horizontalCenter = 0;
         this.addElement(this.line);
         this._4065.label = tr("ComicPropertyPanel.ActionOrder");
         this._4065.width = 128;
         this._4065.horizontalCenter = 0;
         this._4065.bottom = 13;
         this.addElement(this._4065);
         this._4048.height = 25;
         this._4048.skinName = _817;
         this._4048.left = 5;
         this._4048.top = 5;
         this._4048.right = 5;
         this._4048.dataProvider = this._6186;
         this._4048.selectedIndex = 0;
         this._4048.percentWidth = 100;
         this._4048.addEventListener(IndexChangeEvent.CHANGE,this._6181);
         this._2632.addElement(this._4048);
         this._6161.addElement(this._2565);
         this._2565.percentWidth = 100;
         this._2565.top = 30;
         this._2565.selectedIndex = 1;
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
      }
      
      private function _6181(param1:IndexChangeEvent) : void
      {
         this._2565.selectedIndex = param1.newIndex;
         this._3056._10315 = param1.newIndex;
         this._2894();
      }
      
      public function _2894() : void
      {
         if(Boolean(this._4080) && this._4080.length > 0)
         {
            this._6162();
            this.addElement(this._2632);
            this.addElement(this._6161);
            switch(this._2565.selectedIndex)
            {
               case 0:
                  this._4042._4080 = this._4080;
                  this._4042._2894();
                  break;
               case 1:
                  this._4043._4080 = this._4080;
                  this._4043._2894();
                  break;
               case 2:
                  this._6183._4080 = this._4080;
                  this._6183._2894();
            }
         }
         else
         {
            this._6162();
            this.addElement(this._4028);
            this._4028.model = this._6185;
            this._4028.invalidateDisplayList();
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
      
      public function get _6185() : _763
      {
         return this._6184;
      }
      
      public function set _6185(param1:_763) : void
      {
         this._6184 = param1;
      }
      
      private function _6162() : void
      {
         if(Boolean(this._2632) && Boolean(this._2632.parent))
         {
            Group(this._2632.parent).removeElement(this._2632);
         }
         if(Boolean(this._6161) && Boolean(this._6161.parent))
         {
            Group(this._6161.parent).removeElement(this._6161);
         }
         if(Boolean(this._4028) && Boolean(this._4028.parent))
         {
            Group(this._4028.parent).removeElement(this._4028);
         }
      }
      
      public function get _3056() : _556
      {
         return _1407.getInstance(_556) as _556;
      }
   }
}

