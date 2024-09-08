package _944
{
   import _1045.Group;
   import _1045._1082;
   import _1045._1105;
   import _1177.UIEvent;
   import _1185._1188;
   import _1185._1197;
   import _127._142;
   import _1374.IconButton;
   import _834._10617;
   import egret.utils.tr;
   
   public class _10622 extends Group
   {
      private var _10831:Object = "/assets/welcome/more.png";
      
      private var _10830:String;
      
      private var _10834:_1105;
      
      private var _10837:IconButton;
      
      private var _13033:String = "";
      
      private var _1890:Boolean = false;
      
      public function _10622(param1:String = null, param2:String = null)
      {
         this._10830 = tr("Welcome.untitled");
         this._10834 = new _1105();
         this._10837 = new _142();
         if(param1)
         {
            this._10831 = param1;
         }
         if(param2)
         {
            this._10830 = param2;
         }
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         var _loc1_:_1197 = new _1197();
         _loc1_._2401 = _1188.CENTER;
         _loc1_.gap = 10;
         this.layout = _loc1_;
         this._10834._6704 = 64;
         this._10834._6706 = 64;
         this._10834.source = this._10831;
         this._10834.buttonMode = true;
         var _loc2_:_1082 = new _1082();
         _loc2_.includeInLayout = false;
         _loc2_._2529 = 0;
         _loc2_.fillColor = 2171169;
         _loc2_.height = 64;
         _loc2_.width = 64;
         _loc2_._2563 = 2237994;
         _loc2_._2564 = 1;
         _loc2_._2562 = 4;
         this._10837.skinName = _10617;
         this._10837.label = this._10830;
         this._10837._6706 = 64;
         if(this._13033 != "")
         {
            this._10837.toolTip = this._13033;
         }
         this.addElement(this._10834);
         this.addElement(_loc2_);
         this.addElement(this._10837);
         this._1890 = true;
         this.buttonMode = true;
      }
      
      public function dispose() : void
      {
         this._2426();
      }
      
      public function set _10668(param1:String) : void
      {
         this._10830 = param1;
         this._10837.label = this._10830;
         if(this._13033 != "")
         {
            this._10837.toolTip = this._13033;
         }
      }
      
      public function set imageUrl(param1:Object) : void
      {
         if(!param1)
         {
            this._10831 = "/assets/welcome/more.png";
         }
         else
         {
            this._10831 = param1;
         }
         if(this._1890)
         {
            this._10834.source = this._10831;
         }
         else
         {
            this.addEventListener(UIEvent.CREATION_COMPLETE,this._10856);
         }
      }
      
      public function get _10773() : String
      {
         return this._13033;
      }
      
      public function set _10773(param1:String) : void
      {
         this._10837.toolTip = param1;
         this._13033 = param1;
      }
      
      public function _10856(param1:UIEvent) : void
      {
         this._10834.source = this._10831;
      }
   }
}

