package _521
{
   import _1146._1145;
   import _1148._1150;
   import _1148._1152;
   import _1155.Linear;
   import flash.utils.Dictionary;
   
   public class DBAnimateManager
   {
      private static var instance:DBAnimateManager;
      
      public static const ZOOMSTAGE:String = "ZOOMSTAGE_DBANIMATE";
      
      private var _1849:Dictionary;
      
      private var _3771:Object;
      
      private var animate:_1145;
      
      public var _3769:String = "";
      
      public function DBAnimateManager()
      {
         this._1849 = new Dictionary();
         super();
         if(instance)
         {
            throw "DBAnimateManager 是一个单例";
         }
      }
      
      public static function getInstance() : DBAnimateManager
      {
         if(!instance)
         {
            instance = new DBAnimateManager();
         }
         return instance;
      }
      
      public function _3385(param1:String, param2:int = 150, param3:Number = NaN) : void
      {
         var _loc4_:_1145 = null;
         param1 = this._3769 + param1;
         if(!this._1849.hasOwnProperty(param1))
         {
            (_loc4_ = new _1145())._3772 = new Linear();
            this._3771 = new Object();
            this._3771.animate = _loc4_;
            this._1849[param1] = this._3771;
            if(!isNaN(param3))
            {
               this._3771.finalScaleX = param3;
            }
            else
            {
               this._3771.finalScaleX = 1;
            }
         }
         this._3771 = this._1849[param1];
         this._3771.animate.motionPaths = new Vector.<_1150>();
         this._3771.animate.duration = param2;
      }
      
      public function _3382(param1:String, param2:Number, param3:Number) : void
      {
         if(this._3771.finalScaleX != param2)
         {
         }
         param3 = param3 < 20 ? param3 : 20;
         param3 = param3 > 0.2 ? param3 : 0.2;
         this._3771.finalScaleX = param3;
         var _loc4_:_1150 = new _1152(param1,param2,param3);
         this._3771.animate.motionPaths.push(_loc4_);
      }
      
      public function _3381(param1:String, param2:Number, param3:Number) : void
      {
         if(!isNaN(param2))
         {
            this._3771.finalMoveX = param2;
            if(this._3771.finalMoveX != param2)
            {
            }
            this._3771.finalMoveX = param3;
            var _loc4_:_1150 = new _1152(param1,param2,param3);
            this._3771.animate.motionPaths.push(_loc4_);
            return;
         }
         throw Error("坐标值为非数字");
      }
      
      public function _3380(param1:String, param2:Number, param3:Number) : void
      {
         if(!isNaN(param2))
         {
            this._3771.finalMoveY = param2;
            if(this._3771.finalMoveY != param2)
            {
            }
            this._3771.finalMoveY = param3;
            var _loc4_:_1150 = new _1152(param1,param2,param3);
            this._3771.animate.motionPaths.push(_loc4_);
            return;
         }
         throw Error("坐标值为非数字");
      }
      
      public function play(param1:Array) : void
      {
         this._3771.animate.play(param1);
      }
   }
}

