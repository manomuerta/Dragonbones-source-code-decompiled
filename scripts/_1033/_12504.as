package _1033
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1084;
   import _1045._1105;
   import _1185._1196;
   import egret.core._1110;
   import flash.text.TextFormatAlign;
   
   public class _12504 extends _1084
   {
      private var _10012:Class;
      
      private var _10008:Class;
      
      private var _10007:_1110;
      
      private var _10016:Class;
      
      private var _10010:Class;
      
      private var _10009:_1110;
      
      private var _10017:Class;
      
      private var _10013:Class;
      
      private var _10011:_1110;
      
      private var _10018:Class;
      
      private var _10015:Class;
      
      private var _10014:_1110;
      
      private var icon:_1105;
      
      public var labelDisplay:Label;
      
      private var _10019:Group;
      
      public function _12504()
      {
         this._10012 = _12504__10012;
         this._10008 = _12504__10008;
         this._10007 = new _1110(this._10012,this._10008);
         this._10016 = _12504__10016;
         this._10010 = _12504__10010;
         this._10009 = new _1110(this._10016,this._10010);
         this._10017 = _12504__10017;
         this._10013 = _12504__10013;
         this._10011 = new _1110(this._10017,this._10013);
         this._10018 = _12504__10018;
         this._10015 = _12504__10015;
         this._10014 = new _1110(this._10018,this._10015);
         super();
         this.states = ["up","over","down","disabled","upAndSelected","overAndSelected","downAndSelected","disabledAndSelected"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._10019 = new Group();
         this.addElement(this._10019);
         this.icon = new _1105();
         this.icon.verticalCenter = 0;
         this._10019.addElement(this.icon);
         this.labelDisplay = new Label();
         this.labelDisplay.textAlign = TextFormatAlign.LEFT;
         this.labelDisplay.verticalAlign = _1196.MIDDLE;
         this.labelDisplay._6080 = 1;
         this.labelDisplay.left = 15;
         this.labelDisplay.right = 0;
         this.labelDisplay.verticalCenter = 0;
         this._10019.addElement(this.labelDisplay);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         if(_2080 == "up" || _2080 == "disabled")
         {
            this.icon.source = this._10007;
         }
         else if(_2080 == "over" || _2080 == "down")
         {
            this.icon.source = this._10009;
         }
         else if(_2080 == "upAndSelected" || _2080 == "disabledAndSelected")
         {
            this.icon.source = this._10011;
         }
         else if(_2080 == "downAndSelected" || _2080 == "overAndSelected")
         {
            this.icon.source = this._10014;
         }
         if(_2080 == "disabled" || _2080 == "disabledAndSelected")
         {
            this._10019.alpha = 0.5;
         }
         else
         {
            this._10019.alpha = 1;
         }
      }
   }
}

