package _541
{
   import _1177.MenuEvent;
   import _28._29;
   import _543._542;
   import _543._544;
   import _543._545;
   import _543._546;
   import _543._547;
   import _543._548;
   import _543._549;
   import _543._550;
   import _543._551;
   import _543._552;
   import _708._715;
   import _710._709;
   import _710._711;
   import _710._712;
   import _710._713;
   import _874._873;
   import _93._94;
   import _97._115;
   
   public class _540 extends _94
   {
      private var _3936:Object;
      
      private var helper:_544;
      
      private var contextMenu:_873;
      
      public function _540()
      {
         this._3936 = {};
         super();
         this.contextMenu = new _873(stage,this._3935);
         var _loc1_:_545 = new _545(this.contextMenu,this);
         var _loc2_:_550 = new _550(this.contextMenu,this);
         var _loc3_:_547 = new _547(this.contextMenu,this);
         var _loc4_:_549 = new _549(this.contextMenu,this);
         var _loc5_:_552 = new _552(this.contextMenu,this);
         var _loc6_:_548 = new _548(this.contextMenu,this);
         var _loc7_:_542 = new _542(this.contextMenu,this);
         var _loc8_:_546 = new _546(this.contextMenu,this);
         this._3936 = {
            "stage":{
               "blank":new _551(this.contextMenu,this),
               "bone":_loc1_,
               "image":_loc3_,
               "mesh":_loc3_,
               "childSymbol":_loc3_
            },
            "scenePanel":{
               "mainSymbol":_loc4_,
               "bone":_loc1_,
               "slot":_loc2_,
               "image":_loc3_,
               "mesh":_loc3_,
               "childSymbol":_loc3_
            },
            "timeline":{
               "frame":_loc5_,
               "timeline":_loc5_
            },
            "libraryPanel":{
               "armature":_loc6_,
               "asset":_loc6_,
               "folder":_loc6_,
               "blank":_loc6_,
               "vitualfolder":_loc6_
            },
            "animationPanel":{"animation":_loc7_},
            "animationPanel":{"animation":_loc7_},
            "comic":{
               "slot":_loc8_,
               "addTween":_loc8_,
               "addAppear":_loc8_,
               "addDisAppear":_loc8_,
               "changeTween":_loc8_,
               "changeAppearTween":_loc8_,
               "changeDisappearTween":_loc8_
            }
         };
      }
      
      public function _3934(param1:_711, param2:_712, param3:Array = null, param4:Number = -9999, param5:Number = -9999) : void
      {
         this.helper = this._3936[param1.toString()][param2.toString()];
         if(!this.helper)
         {
            return;
         }
         if(param4 == -9999 && param5 == -9999)
         {
            param4 = stage.mouseX;
            param5 = stage.mouseY;
         }
         this.helper._3937(param1,param2,this._2873,param3,param4,param5);
      }
      
      public function _3935(param1:MenuEvent) : void
      {
         var _loc2_:_29 = null;
         var _loc3_:_713 = _709._1665[param1.item.@id];
         if(_loc3_)
         {
            _loc2_ = _115._2364(_loc3_) as _29;
         }
         else
         {
            _loc2_ = _115._2364(String(param1.item.@id)) as _29;
         }
         this.helper._3935(_loc2_);
      }
      
      protected function get _2873() : _715
      {
         return _2220._2873;
      }
      
      public function _11294() : void
      {
         if(this.contextMenu)
         {
            this.contextMenu._11294();
         }
      }
   }
}

