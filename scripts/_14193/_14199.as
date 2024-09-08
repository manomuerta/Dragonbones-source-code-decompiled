package _14193
{
   import _14173._14172;
   import _14201._14210;
   import _14223._14222;
   import _14223._14225;
   import _14223._14226;
   import _14223._14227;
   import _14240._14246;
   import flash.display.Graphics;
   import flash.display.GraphicsPathWinding;
   
   public class _14199 extends _14198
   {
      private var _15292:Vector.<_14210>;
      
      private var _15285:Vector.<_14172>;
      
      public function _14199(param1:String)
      {
         this._15292 = new Vector.<_14210>();
         super(param1);
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         this.mouseChildren = false;
      }
      
      override protected function render() : void
      {
         var dashedGraphicsPathDrawer:_14225 = null;
         var dashedDrawer:_14222 = null;
         super.render();
         this._15285 = null;
         this._15291();
         content.graphics.clear();
         if(_15278 && !_15274)
         {
            lineStyle(content.graphics);
         }
         beginFill(content.graphics,function():void
         {
            _15282();
            content.graphics.endFill();
         });
         if(_15274)
         {
            dashedGraphicsPathDrawer = new _14225();
            dashedDrawer = new _14222(dashedGraphicsPathDrawer);
            _15268(dashedDrawer);
            this._15288(dashedDrawer);
            lineStyle(content.graphics);
            content.graphics.drawPath(dashedGraphicsPathDrawer.commands,dashedGraphicsPathDrawer.pathData);
            content.graphics.endFill();
         }
         this._15287();
      }
      
      private function _15282() : void
      {
         var _loc2_:_14225 = null;
         var _loc3_:_14227 = null;
         var _loc1_:Boolean = this._15290 && this._15285 == null;
         if(!_loc1_ && this._15281)
         {
            this._15283(content.graphics);
         }
         else
         {
            _loc2_ = new _14225();
            if(_loc1_)
            {
               _loc3_ = new _14227(_loc2_);
               content.graphics.drawPath(_loc2_.commands,_loc2_.pathData,this._15284());
               this._15288(_loc3_);
               this._15285 = _loc3_._15286();
            }
            else
            {
               this._15288(_loc2_);
            }
            content.graphics.drawPath(_loc2_.commands,_loc2_.pathData,this._15284());
         }
      }
      
      protected function _15291() : void
      {
      }
      
      protected function _15288(param1:_14226) : void
      {
      }
      
      protected function _15283(param1:Graphics) : void
      {
      }
      
      protected function get _15281() : Boolean
      {
         return false;
      }
      
      private function get _15290() : Boolean
      {
         return _15278 && (Boolean(style._15181("marker")) || Boolean(style._15181("marker-start")) || Boolean(style._15181("marker-mid")) || Boolean(style._15181("marker-end")));
      }
      
      private function _15284() : String
      {
         var _loc1_:String = _15259._15181("fill-rule") || "nonzero";
         switch(_loc1_.toLowerCase())
         {
            case GraphicsPathWinding.EVEN_ODD.toLowerCase():
               return GraphicsPathWinding.EVEN_ODD;
            case GraphicsPathWinding.NON_ZERO.toLowerCase():
               return GraphicsPathWinding.NON_ZERO;
            default:
               return GraphicsPathWinding.NON_ZERO;
         }
      }
      
      private function _15287() : void
      {
         var _loc1_:_14210 = null;
         var _loc2_:_14172 = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:_14210 = null;
         var _loc7_:Number = NaN;
         for each(_loc1_ in this._15292)
         {
            _15200(_loc1_);
            content.removeChild(_loc1_);
         }
         if(this._15285)
         {
            for each(_loc2_ in this._15285)
            {
               _loc3_ = "marker-" + _loc2_.type;
               _loc4_ = _15259._15181(_loc3_) || _15259._15181("marker");
               if(_loc4_)
               {
                  _loc5_ = _14246._15251(_loc4_);
                  if(_loc5_)
                  {
                     _loc6_ = document._15206(_loc5_) as _14210;
                     if(_loc6_)
                     {
                        _loc7_ = 1;
                        if(_15259._15181("stroke-width"))
                        {
                           _loc7_ = _15258(_15259._15181("stroke-width"),_14246.WIDTH_HEIGHT);
                        }
                        _loc2_._15175 = _loc7_;
                        _loc6_._15289 = _loc2_;
                        content.addChild(_loc6_);
                        _15201(_loc6_);
                        this._15292.push(_loc6_);
                     }
                  }
               }
            }
         }
      }
   }
}

