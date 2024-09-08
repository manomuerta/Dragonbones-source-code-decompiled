package _1439
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1084;
   import _1045._1105;
   import _1177.UIEvent;
   import _1185._1189;
   import _1185._1196;
   
   public class _1243 extends _1084
   {
      public var _2448:_1105;
      
      public var labelDisplay:Label;
      
      private var group:Group;
      
      public var _2530:_1082;
      
      private var _2440:Group;
      
      public function _1243()
      {
         super();
         this.states = ["up","down","over"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.group = new Group();
         this.group.top = 0;
         this.group.bottom = 0;
         this.addElement(this.group);
         this._2530 = new _1082();
         this._2530.top = 0;
         this._2530.bottom = 1;
         this._2530.left = this._2530.right = 0;
         this._2530._2529 = 0;
         this.group.addElement(this._2530);
         this._2440 = new Group();
         var _loc1_:_1189 = new _1189();
         _loc1_.verticalAlign = _1196.CONTENT_JUSTIFY;
         _loc1_.gap = 0;
         this._2440.top = this._2440.bottom = 0;
         this._2440.layout = _loc1_;
         this.group.addElement(this._2440);
         var _loc2_:_1105 = new _1105();
         _loc2_.width = 5;
         _loc2_.height = 5;
         this._2440.addElement(_loc2_);
         this._2448 = new _1105();
         this._2448.verticalCenter = 0;
         this._2440.addElement(this._2448);
         this.labelDisplay = new Label();
         this.labelDisplay.percentHeight = 100;
         this.labelDisplay.verticalAlign = _1196.MIDDLE;
         this._2440.addElement(this.labelDisplay);
         _loc2_ = new _1105();
         _loc2_.width = 5;
         _loc2_.height = 5;
         this._2440.addElement(_loc2_);
         this.labelDisplay.addEventListener(UIEvent.UPDATE_COMPLETE,this._8053);
      }
      
      protected function _8053(param1:UIEvent) : void
      {
         if(!this._2448.source)
         {
            this._2448.visible = this._2448.includeInLayout = false;
         }
         else
         {
            this._2448.visible = this._2448.includeInLayout = true;
         }
      }
      
      override protected function _2519() : void
      {
         super._2519();
         if(_2080 == "up")
         {
            this._2530._2529 = 0;
         }
         else if(_2080 == "over")
         {
            this._2530.fillColor = 3687762;
            this._2530._2529 = 1;
         }
         else if(_2080 == "down")
         {
            this._2530.fillColor = 1382686;
            this._2530._2529 = 1;
         }
      }
   }
}

