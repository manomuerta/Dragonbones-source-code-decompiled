package _1045
{
   import _1038._1039;
   import _1177.RendererExistenceEvent;
   import _1193._1192;
   import egret.core._1133;
   import egret.core.ns_egret;
   
   use namespace ns_egret;
   
   public class SkinnableDataContainer extends _1085 implements _1071
   {
      public var _2490:_1046;
      
      private var _8361:Object;
      
      public function SkinnableDataContainer()
      {
         this._8361 = {};
         super();
      }
      
      public function _2481(param1:_1070, param2:int, param3:Object) : _1070
      {
         if(param1 is _1133)
         {
            (param1 as _1133)._6967(this);
         }
         param1.itemIndex = param2;
         param1.label = this._7442(param3);
         param1.data = param3;
         return param1;
      }
      
      public function _7442(param1:Object) : String
      {
         if(param1 !== null)
         {
            return param1.toString();
         }
         return " ";
      }
      
      public function get dataProvider() : _1039
      {
         return this._2490 != null ? this._2490.dataProvider : this._8361.dataProvider;
      }
      
      public function set dataProvider(param1:_1039) : void
      {
         if(this._2490 == null)
         {
            this._8361.dataProvider = param1;
         }
         else
         {
            this._2490.dataProvider = param1;
         }
      }
      
      public function get itemRenderer() : Class
      {
         return !!this._2490 ? this._2490.itemRenderer : this._8361.itemRenderer;
      }
      
      public function set itemRenderer(param1:Class) : void
      {
         if(this._2490 == null)
         {
            this._8361.itemRenderer = param1;
         }
         else
         {
            this._2490.itemRenderer = param1;
         }
      }
      
      public function get _2514() : Object
      {
         return !!this._2490 ? this._2490._2514 : this._8361._2514;
      }
      
      public function set _2514(param1:Object) : void
      {
         if(this._2490 == null)
         {
            this._8361._2514 = param1;
         }
         else
         {
            this._2490._2514 = param1;
         }
      }
      
      public function get _6053() : Function
      {
         return !!this._2490 ? this._2490._6053 : this._8361._6053;
      }
      
      public function set _6053(param1:Function) : void
      {
         if(this._2490 == null)
         {
            this._8361._6053 = param1;
         }
         else
         {
            this._2490._6053 = param1;
         }
      }
      
      public function get layout() : _1192
      {
         return !!this._2490 ? this._2490.layout : this._8361.layout;
      }
      
      public function set layout(param1:_1192) : void
      {
         if(this._2490 == null)
         {
            this._8361.layout = param1;
         }
         else
         {
            this._2490.layout = param1;
         }
      }
      
      public function get autoLayout() : Boolean
      {
         var _loc1_:* = undefined;
         if(this._2490)
         {
            return this._2490.autoLayout;
         }
         _loc1_ = this._8361.autoLayout;
         return _loc1_ === undefined ? true : _loc1_;
      }
      
      public function set autoLayout(param1:Boolean) : void
      {
         if(this._2490)
         {
            this._2490.autoLayout = param1;
         }
         else
         {
            this._8361.autoLayout = param1;
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._2490)
         {
            if(this._8361.layout !== undefined)
            {
               this._2490.layout = this._8361.layout;
            }
            if(this._8361.autoLayout !== undefined)
            {
               this._2490.autoLayout = this._8361.autoLayout;
            }
            if(this._8361.dataProvider !== undefined)
            {
               this._2490.dataProvider = this._8361.dataProvider;
            }
            if(this._8361.itemRenderer !== undefined)
            {
               this._2490.itemRenderer = this._8361.itemRenderer;
            }
            if(this._8361._2514 !== undefined)
            {
               this._2490._2514 = this._8361._2514;
            }
            if(this._8361._6053 !== undefined)
            {
               this._2490._6053 = this._8361._6053;
            }
            this._2490.ns_egret::_7618 = this;
            this._8361 = {};
            if(hasEventListener(RendererExistenceEvent.RENDERER_ADD))
            {
               this._2490.addEventListener(RendererExistenceEvent.RENDERER_ADD,dispatchEvent);
            }
            if(hasEventListener(RendererExistenceEvent.RENDERER_REMOVE))
            {
               this._2490.addEventListener(RendererExistenceEvent.RENDERER_REMOVE,dispatchEvent);
            }
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         var _loc3_:Object = null;
         super.partRemoved(param1,param2);
         if(param2 == this._2490)
         {
            this._2490.removeEventListener(RendererExistenceEvent.RENDERER_ADD,dispatchEvent);
            this._2490.removeEventListener(RendererExistenceEvent.RENDERER_REMOVE,dispatchEvent);
            _loc3_ = {};
            _loc3_.layout = this._2490.layout;
            _loc3_.autoLayout = this._2490.autoLayout;
            _loc3_.dataProvider = this._2490.dataProvider;
            _loc3_.itemRenderer = this._2490.itemRenderer;
            _loc3_._2514 = this._2490._2514;
            _loc3_._6053 = this._2490._6053;
            this._8361 = _loc3_;
            this._2490.ns_egret::_7618 = null;
            this._2490.dataProvider = null;
            this._2490.layout = null;
         }
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         super.addEventListener(param1,param2,param3,param4,param5);
         if(param1 == RendererExistenceEvent.RENDERER_ADD && Boolean(this._2490))
         {
            this._2490.addEventListener(RendererExistenceEvent.RENDERER_ADD,dispatchEvent);
         }
         if(param1 == RendererExistenceEvent.RENDERER_REMOVE && Boolean(this._2490))
         {
            this._2490.addEventListener(RendererExistenceEvent.RENDERER_REMOVE,dispatchEvent);
         }
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         if(param1 == RendererExistenceEvent.RENDERER_ADD && Boolean(this._2490))
         {
            if(!hasEventListener(RendererExistenceEvent.RENDERER_ADD))
            {
               this._2490.removeEventListener(RendererExistenceEvent.RENDERER_ADD,dispatchEvent);
            }
         }
         if(param1 == RendererExistenceEvent.RENDERER_REMOVE && Boolean(this._2490))
         {
            if(!hasEventListener(RendererExistenceEvent.RENDERER_REMOVE))
            {
               this._2490.removeEventListener(RendererExistenceEvent.RENDERER_REMOVE,dispatchEvent);
            }
         }
      }
   }
}

